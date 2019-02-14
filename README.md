# FRIteza - doctoral dissertation XeLaTeX template
## University of Ljubljana, Faculty of Computer and Information Science

For further information please read the supplied [`FRIteza.pdf`](https://github.com/UL-FRI/thesis-BDR/blob/master/FRIteza.pdf) or [`FRIteza.md`](https://github.com/UL-FRI/thesis-BDR/blob/master/FRIteza.md).


### Quick-start

Make sure to have MiKTeX installed. Follow [the tutorial](https://miktex.org/) for your platform.

Clone the repository:

    $ git clone https://github.com/UL-FRI/thesis-BDR.git

Enter the folder:

    $ cd thesis-BDR

Install all the MiKTeX packages listed in `packages.txt`. Use the GUI or command line:

    $ mpm --require=@packages.txt
    78 packages have been successfully installed.

Make sure to initialize all the selected languages (Slovene and UK English):

    $ initexmf --mklangs
    $ initexmf --dump

Recreate the `demo-asbook` example<a href="#note1" id="note1ref" title="Depending on the OS, use `build.bat` or `build.sh`."><sup>1</sup></a>:

    $ cd demo-asbook
    $ ../editor-cfg/build.sh gold

The build script has three parameters `<stage>`, `-no-bib` and `<rebuilds>`. The main parameter specifies the stage of the thesis, which determines the formatting of the generated PDF:

* `pre-alpha`: early drafts - no chapter thumbs, increased font when printed fit to page,
* `alpha`: for review by advisor - no chapter thumbs, increased font when printed fit to page,
* `beta`: for seminar 5 - no chapter thumbs, increased font when printed fit to page,
* `gamma`: for senate approval - no chapter thumbs, _includes rebuttal_ __TODO__,
* `gold`: final approved version - rebuttal not displayed, chapter pages in colour, chapter thumbs,
* `press`: for print - gold with trim marks.

The `-no-bib` optional parameter suppresses the rebuilding of the bibiliography.

The `<rebuilds>` optional parameter specifies the number of pre-pdf re-runs and is useful in the event you see a warning in the last lines of the output, such as:

    Package atenddvi Warning: Rerun LaTeX, last page has changed.

or

    LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.

In this case you can increase the number of pre-pdf re-runs until all Warning messages disappear (e.g. three pre-pdf re-runs):

    $ ../editor-cfg/build.sh gold 3

You should find `thesis-<stage>.pdf` in folder `out`:

    $ ls out
    thesis-gold.pdf         thesis-gold.synctex.gz

To build the cover page, run<a href="#note2" id="note2ref" title="The same `build-cover.bar` script should run on Windows, Linux and macOS."><sup>2</sup></a>:

    $ ../editor-cfg/build-cover.bat

You should find `cover.pdf` in folder `out`:

    $ ls out
    cover.pdf               thesis-gold.pdf         thesis-gold.synctex.gz

***
<a id="note1" href="#note1ref"><sup>1</sup></a>Depending on the OS, use `build.bat` or `build.sh`.

<a id="note2" href="#note2ref"><sup>2</sup></a>The same `build-cover.bar` script should run on Windows, Linux and macOS.
