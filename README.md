# Thesis RP25

This repo. holds the source code of my presentation and paper.

## Compiling

Dep.s:
```
apt update
apt install -y docker.io python3-pip
pip3 install docker-compose
```

compile document (either 'report', 'slides' or 'proposal'):
```
export SUBJECT=report
docker-compose up
```

### Inner workings

We allow content of the paper to be either in `.md` or `.txt`.
<!--
This allows us to write ASCII art diagrams in `.txt` files,
which open in browser and we can include in our presentation.
-->

`build.sh` uses the `SUBJECT` (e.g. report)
and sets the subject values in `pandoc_metadata.yml`
and uses the content in all directories that include the subject in its name
(e.g. `report_todo`, `report_done` and `intersection_proposal_report`).

## Why markdown?

For my thesis I intentially wanted to take a
holistic approach to the file structure of my paper.
I personally like markdown as it simplifies my work
and forces me to not spend time on the layout but the content.
*Since I lost myself in the possibilites *tex offers me in the past.*

Using multiple files, directories and intersections was what worked best
for me with version control.

## Structure of paper files

### Format proposal/PoA (plan of approach)

Chapters based on these
[requirements](https://rp.delaat.net/process.html#Project_Proposal).

- Title, names
- Introduction (context and relevance)
  - Research question (problem statement)
  - Related work (prior work)
- Approach (Method)
  - Scope (limitations)
    - expected future work (out of scope)
  - Resources (Stuff and people needed)
  - Planning
  - (ethical) Considerations
    - ethics
- Expected results (e.g. PoC)
  - Value proposition 
- References (`*.bib`)

### Format report

- Title, names, abstract (summary)
- Introduction (context)
  - Research question (problem statement)
  - Related work (prior work)
- Methodology (model)
- Results (analysis, evaluation, comparison model, simulation)
- Discussion
  - Conclusions
  - Future work
- References (`*.bib`)

### overview of what is stored where

| Proposal | intersection | Report | location |
| --- | --- | --- | --- |
| | title | | `pandoc_metadata.yml` |
| | names | | `pandoc_metadata.yml` |
| | | abstract | `pandoc_metadata.yml` |
| | | | |
| | intro | | `intersection*/1*.md` |
| | | | |
| approach | | model | `<SUBJECT>/3*.md` |
| | | | |
| exp. result | | result | `<SUBJECT>/5*.md` |
| | | | |
| | | discuss | `report/7*.md` |
| | | | |
| | | appendix | `report/9*.md` |
| | | | |
| | bib | | `intersection*/999bib.md` |

### Approach

I approached this research like a Kanban/Scrum items backlog.
Initially all ideas/items are future work,
item by item gets tackled,
in order of priority.
<!--
Scope small; under promise, over deliver.
-->

## Links

- https://medium.com/@krzysztofczarnecki/i-wrote-my-thesis-in-markdown-heres-how-it-went-3f60140dfe65
- https://v4.chriskrycho.com/2015/academic-markdown-and-citations.html
- https://stackoverflow.com/questions/13545725/automatically-create-bibliography-from-bibtex-in-pandoc-markdown-without-inline/13558096#13558096
- https://www2.le.ac.uk/offices/ld/resources/writing/writing-resources/reports
- https://www.scribbr.com/category/dissertation/
- Dealing with page breaks: https://superuser.com/questions/601469/getting-chapters-to-start-on-a-new-page-in-a-pandoc-generated-pdf



