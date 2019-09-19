# MISIS/FLAG Thesis Template

This repository holds the basic definition and structure to write the bachelor/master/doctorate thesis document.

## Thesis Structure

The document should be structured by means of its chapters.

The main file of the document is `main.tex`. This file contains the basic definition of the formatting, and document structure. New chapters should be included in this file by means of the `\include{CHAPTER_NAME}` command.

All bibliography entries should be added in the `bib/local.bib` file, or added to a new file in the `bib` directory.

Figures should be added as vectorized figures (i.e., pdf, svg) to the `figures` folder.

Tables should be added as independent `.tex` files per table to the `tables` folder

## Useful Commands
The `thesis.cls` file contains the definition for all commands that can be used within the document's text. In case new packages are required or you need to (re)define commands, the should be added in this file.

- References to floating objects (figures, tables, listings, sections, etc) are managed with the fancy-ref package. This package avoids the use of the explicit name and numbering of the object.
  - Chapters should be labeled as `\label{cha:name}`. To refer to the chapter you should use the command `\fref{cha:name}`. This will generate `Chapter 1` in the text
  - Section definition should be labeled as `\label{sec:name}`. Refer to sections as `\fref{sec:name}` to generate the `Section 1` text.
  - Figures definition should be labeled as `\label{fig:name}`. Refer to figures as `\fref{fig:name}` to generate the `Figure 1` text.
  - Tables definition should be labeled as `\label{tab:name}`. Refer to tables as `\fref{tab:name}` to generate the `Table 1` text.
  - Listings (source code) definition should be labeled as `\label{lst:name}`. Refer to listings as `\fref{lst:name}` to generate the `Snippet 1` text.
  - Lines (in the source code) definition should be labeled as `\label{ln:name}`. Refer to lines as `\fref{ln:name}` to generate the `Line 1` text.
- Acronyms can be used to refer to commonly used acronyms in short, label, full, plural forms. Acronyms are defined in the `acronym.tex` file in the root folder using the command `\acrodef{ACRONYM}[OPTIONAL]{FULL NAME}`, where `ACRONYM` corresponds to the (3 letter) acronym, `OPTIONAL` is the way in which the acronym will be displayed (not adding one will just print whatever is in the acronym). Optional definitions are useful for acronyms with special plural forms or uncommon representation (e.g., IoT). `FULL NAME` is the complete name of the acronym.
  - `\ac{ACRONYM}` is used to display the acronym. Upon the first use it will display it as `FULL NAME (ACRONYM)`. Following uses will just display `ACRONYM`
  - `\acs{ACRONYM}` displays just the short form of the acronym, i.e., `ACRONYM`
  - `\acp{ACRONYM}` displays the plural form of the acronym (adding a small-caps s at the end)
  - `\acf{ACRONYM}` displays the full name of the acronym with its acronym, regardless of previous uses of it
  - `\acl{ACRONYM}` displays just the full name of the acronym
- latin shorthands for that is (i.e.,) and for example (e.g.,) are used with the commands `\ie` and `\eg` respectively

## Other Useful Tools
- Enumerations, items, and descriptions  are defined in the `enumitem` package. In particular inline enumerations are used as follows.
```
\begin{enumerate*}[label=(\arabic*)]
\item My first inline item
\item My second inline item
\end{enumerate*}
```
Note the use of the label definition in the `enumerate*` environment. Inline lists should **always** use the format `(1)` as this is the clear style to enumerate them in scientific writing.

- Bibliography references are defined using bibtex and referenced using the IEEE reference format as defined in the `natbib` package
  - The `\cite{REF}` command generates the numeric reference `[1]`
  - The `\citet{REF}` command generates the author-numeric reference `Lastname, Firstname et al. [1]`

### Source code definition
Source code is defined using the `listings` package

## Document Tools
- The list of terms at the end of the document is auto-generated using the list of terms definition. Terms to appear in the list should be used in the text with the command `\term{TERM}`
- definitions
- symbols

# Writing tips
