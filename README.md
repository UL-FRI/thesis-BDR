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
    77 packages have been successfully installed.

Make sure to initialize all the selected languages (Slovene and UK English):

    $ initexmf --mklangs
    $ initexmf --dump

Recreate the demo-asbook example<a href="#note1" id="note1ref" title="The same build script ('build.bat') should work on Windows, Linux and macOS."><sup>1</sup></a>:

    $ cd demo-asbook
    $ ../editor-cfg/build.bat

Most likely you will see a warning in the last lines of the output:

    LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.

Note, you have to re-run the build process until all Warning messages disappear (~5 times):

    $ ../editor-cfg/build.bat
    $ ../editor-cfg/build.bat
    $ ../editor-cfg/build.bat
    $ ../editor-cfg/build.bat
    $ ../editor-cfg/build.bat

You should find the `thesis.pdf` in folder `out`:

    $ ls out
    thesis.pdf              thesis.synctex.gz

***

<a id="note1" href="#note1ref"><sup>1</sup></a>The same build script (`build.bat`) should work on Windows, Linux and macOS.
