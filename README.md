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

The parameter of the build script specifies the stage of the thesis, which determines the formatting of the rendered PDF:

* `pre-alpha`: early drafts - no chapter thumbs, increased font,
* `alpha`: for review by advisor - no chapter thumbs, increased font,
* `beta`: fir seminar 5 - no chapter thumbs, increased font,
* `gamma`: for senate approval - no chapter thumbs, TODO: includes rebuttal,
* `gold`: final approved version - notes not displayed, chapter pages in colour, chapter thumbs,
* `press`: for print - gold with trim marks.

Most likely you will see a warning in the last lines of the output:

    LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.

Note, you have to re-run the build process until all Warning messages disappear (~5 times for this demo and for gold or press, ~2 times for alpha):

    $ ../editor-cfg/build.sh gold
    $ ../editor-cfg/build.sh gold
    $ ../editor-cfg/build.sh gold
    $ ../editor-cfg/build.sh gold
    $ ../editor-cfg/build.sh gold

You should find `thesis.pdf` in folder `out`:

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
