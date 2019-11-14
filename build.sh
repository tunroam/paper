#!/bin/bash -e

if [ -z "$1" ]; then
  echo 'ERROR please provide the SUBJECT, e.g. "proposal"'
  exit 1
else
  SUBJECT=$1
fi


# We allow for multiple bib files
# this is handy when working with multiple people
# to avoid merge conflicts
cat *.bib > /tmp/bundled.bib

cp pandoc_metadata.yml /tmp/meta.yml
sed -i 's/^date:/#date:/' /tmp/meta.yml
sed -i "s/---/---\ndate:\ `date --iso`/" /tmp/meta.yml
sed -i "s/_$SUBJECT:/:/" /tmp/meta.yml


rm -rf /tmp/$SUBJECT 2> /dev/null || true
mkdir -p /tmp/$SUBJECT
for i in `ls`; do
  if [ -d "$i" ]; then
    if [[ "$i" =~ .*"$SUBJECT".* ]]; then
      # Fix quotes in source
      for f in `ls "$i"/*.{md,txt} 2> /dev/null`; do
        sed -i 's/“/"/' $f
        sed -i 's/”/"/' $f
        sed -i "s/‘/'/" $f
        sed -i "s/’/'/" $f
        sed -i "s/;/;/" $f #Greek question mark
        #sed -i 's/\.\ /.\n/g' $f
        #sed -i 's/,\ /,\n/g' $f
        sed -i "s/prepend/prefix/" $f
      done
      echo "NOTE using the content found in $i"
      cp -a $i/* /tmp/$SUBJECT/
    fi
  fi
done

> /tmp/bundled.md
for f in `ls "/tmp/$SUBJECT"/*.{md,txt} 2> /dev/null`; do
  cat $f >> /tmp/bundled.md
  echo   >> /tmp/bundled.md
done
sed -i 's_MAY_\[MAY\](https://www.ietf.org/rfc/rfc2119.txt)_'       /tmp/bundled.md
sed -i 's_MUST_\[MUST\](https://www.ietf.org/rfc/rfc2119.txt)_'     /tmp/bundled.md
sed -i 's_SHOULD_\[SHOULD\](https://www.ietf.org/rfc/rfc2119.txt)_' /tmp/bundled.md

echo "=== begin SPELLCHECK === suggestion: sed -i 's/WRONG/GOOD/'"
touch /usr/lib/aspell/en-personal.pws
if [ -f "jargon.txt" ]; then
  if [[ `wc -L jargon.txt` != "0 jargon.txt" ]]; then
    echo NOTE found jargon.txt, adding words to dictionary
    aspell --lang=en create master \
      /usr/lib/aspell/en-jargon.pws < jargon.txt
    grep -q "en-jargon.pws" /usr/lib/aspell/en_US.multi \
      || echo "add en-jargon.pws" >> /usr/lib/aspell/en_US.multi
  fi
fi

# --personal /usr/lib/aspell/en-jargon.pws
# the sed line removes link references
# and code/comment blocks from spell check
cat /tmp/bundled.md \
  | sed 's/\[@.*\]/\ /' \
  | sed 's/\[^.*\]/\ /' \
  | sed '/^```/,/^```/d' \
  | sed '/^<!--/,/-->/d' \
  | aspell list -t \
  | sort \
  | uniq > misspelled.txt
cat misspelled.txt
echo '=== Finished SPELLCHECK ==='

# --from: commonmark,gfm,markdown,markdown_mmd,markdown_phpextra,markdown_strict
# We'll use: https://pandoc.org/MANUAL.html#pandocs-markdown

# optinal and not used, but may be useful
# --to: epub3,html5,latex
# --base-header-level=1
# --filter ./myscript.py
# --include-before-body=just_after_begin_document.tex
# --include-after-body=after_end_document.tex
# --top-level-division
# --listings for code blocks
# --epub-cover-image=img.png
# --epub-metadata=epubdata.xml https://pandoc.org/MANUAL.html#epub-metadata
# --id-prefix=mainpaper
# --template=template_and_frontpage.tex
# --reference-location = block|section|document

# Following were removed in the context of creating the proposal pdf
#  --standalone \ # did nothing
# --metadata-file pandoc_metadata.yml not in this version https://github.com/jgm/pandoc/issues/1960#issuecomment-242365453
# --metadata-file= see https://pandoc.org/MANUAL.html#extension-yaml_metadata_block
# --pdf-engine xelatex # was suggested on '&#8718;' char, but didn't work

# TODO:
#  -F pandoc-crossref -F pandoc-citeproc \
# http://lierdakil.github.io/pandoc-crossref/

if [ "$SUBJECT" == "slides" ]; then
# https://tex.stackexchange.com/questions/340122/unable-to-add-frame-numbers-to-beamer-when-using-rmarkdown
cat << EOF > /tmp/pagenrs.tex
\setbeamertemplate{navigation symbols}{} 
\setbeamertemplate{footline}[frame number]
EOF
  OUTTYPE=" -t beamer -H /tmp/pagenrs.tex "
else
  OUTTYPE=""
fi

pandoc \
  --from markdown \
  $OUTTYPE \
  --strip-comments \
  --reference-links \
  --number-sections \
  --output "`basename $SUBJECT`.pdf" \
  --bibliography /tmp/bundled.bib \
  --reference-location section \
  /tmp/meta.yml \
  /tmp/bundled.md
