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

    $ mpm --install=@packages.txt
    77 packages have been successfully installed.

Make sure to initialize all the selected languages (Slovene and UK English):

    $ initexmf --mklangs

Recreate the demo-asbook example [^1]:

    $ cd demo-asbook
    $ ../editor-cfg/build.bat

Most likely you will see a warning in the last lines of the output:

    LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.

Note, you have to re-run the build process until the Warning message disappears (~5 times):

    $ ../editor-cfg/build.bat
    $ ../editor-cfg/build.bat
    $ ../editor-cfg/build.bat
    $ ../editor-cfg/build.bat
    $ ../editor-cfg/build.bat

You should find the `thesis.pdf` in folder `out`:

    $ ls out
    thesis.pdf              thesis.synctex.gz

[^1]: The same build script (`build.bat`) should work on Windows, Linux and macOS.
