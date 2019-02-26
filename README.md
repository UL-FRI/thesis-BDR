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

Recreate the `demo-asbook` example:

    $ cd demo-asbook
    $ ../editor-cfg/build gold

The build script optional parameter `<stage>` specifies the stage of the thesis, which determines the formatting of the generated PDF:

* `pre-alpha`: early drafts - no chapter thumbs, increased font when printed fit to page,
* `alpha`: for review by advisor - no chapter thumbs, increased font when printed fit to page,
* `beta`: for seminar 5 - no chapter thumbs, increased font when printed fit to page,
* `gamma`: for senate approval - no chapter thumbs, _includes rebuttal_ __TODO__,
* `gold`: final approved version - rebuttal not displayed, chapter pages in colour, chapter thumbs,
* `press`: for print - coverpage + gold - with trim marks for the bookbinder.

The build script is based on `latexmk`<a href="#note1" id="note1ref" title="Override with v4.61+ provided in 'editor-cfg/'."><sup>1</sup></a>, a [Perl](http://www.perl.org/) script, which automates the process of compiling a LaTeX document. Make sure it is installed. Follow [the tutorial](https://mg.readthedocs.io/latexmk.html) for your platform.

You should find `thesis-<stage>.pdf` in folder `out/`:

    $ ls out
    thesis-gold.fls         thesis-gold.pdf         thesis-gold.synctex.gz

To build the final version that is to be distributed via emails run:

    $ ../editor-cfg/build gold

To build the final version that is to be printed and bookbound run:

    $ ../editor-cfg/build press

If the `<stage>` parameter is ommitted the build script will generate the thesis in the stage that is specified in `thesis.tex` when the `FRIteza` document class is loaded, for example:

    \documentclass[language=english,stage=alpha]{FRIteza}

In this case the folder `out/` will contain files without the stage suffix:

    $ ls out
    thesis.fls         thesis.pdf         thesis.synctex.gz

***

<a id="note1" href="#note1ref"><sup>1</sup></a>Note that there is a minor bug in `latexmk.pl` specific to our use case. The script's author has already been contacted, but until a new version is released you should override the current version (v4.61) wih the modified version (v4.61+) that is provided in `editor-cfg/`. Depending on your OS you should copy `latexmk.pl` into `C:\Program Files\MiKTeX 2.9\scripts\latexmk\`, `~/.miktex/texmfs/install/scripts/latexmk/` (Linux), or `~/Library/Application Support/MiKTeX/texmfs/install/scripts/latexmk/` (macOS). 
