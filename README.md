# mntkonferansen-latex

LaTeX class and styles for contributions to the Norwegian MNT-konferansen.

The class is actively developed leading up to the final submission
date for the conference at the end of January 2019.  If you have
trouble, please contact the developer(s) (below).

## The files:

- template.tex a simple demo to show usage and appearance.
  With the following auxiliary files:
  - Makefile
  - tromso.jpg
  - template.bib
- journal.tex is a similar demo showing the journal version, i.e.
  using the journal option to documentclass.
  It uses the same auxiliary files as the above.
  
- mnt.cls is the class file

- apalike.bst is a simple modification of the standard apalike
  bibliography style using a macro instead of hardcoding the word
  «and».  The class file defines the macro, supporting translations
  for babel options norsk and nynorsk.

## Reference List

Most LaTeX authors are used to using bibtex, which has been around since
the 1980s.  This is oldfashioned.  Better flexibility is obtained with
biblatex, which has better support for unicode and more support for
standard citation style manuals like APA. The database (.bib) is
the same in both cases.

The two examples demonstrate both options.
In `template.tex` bibtex is used.  The class autoloads natbib to
use author-year style citations.
The `journal.tex` example uses the `biblatex` option to `\documentclass`,
which makes the class load biblatex instead of natbib.  Compatibility
mode is used, so both provide the same citation commands.
However, bibliography for the journal version has to be compilaed with
biber instead of bibtex.

Note that there is no reason not to use biblatex with the conference
version or bibtex with the journal version.  The options can be
selected independently.

## Design Questions

There are a couple of questions which should be discussed in the
editorial board:

1.  Caption font.  Should we use italics as for MNT-konferansen.
    The journal version is made with upright font.
2.  Margins.  The narrow margins are awful.
3.  Headers and footers.  Currently a rough draft is proposed.

## Feedback:

**Initial developer:** Hans Georg Schaathun: <hasc@ntnu.no>
