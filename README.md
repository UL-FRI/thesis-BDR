# FRIteza - doctoral dissertation XeLaTeX template

## University of Ljubljana, Faculty of Computer and Information Science

For further information please read the supplied [`FRIteza.pdf`](https://github.com/UL-FRI/thesis-BDR/blob/master/FRIteza.pdf) or [`FRIteza.md`](https://github.com/UL-FRI/thesis-BDR/blob/master/FRIteza.md).

### Quick-start

Make sure to have MiKTeX installed. Follow [the tutorial](https://miktex.org/) for your platform.

Clone the repository:

    git clone https://github.com/UL-FRI/thesis-BDR.git

Enter the folder:

    cd thesis-BDR

Install all the MiKTeX packages listed in `packages.txt`. Use the GUI or command line:

    $ mpm --require=@packages.txt
    78 packages have been successfully installed.

Make sure to initialize all the selected languages (Slovene and UK English):

    initexmf --mklangs
    initexmf --dump

Make sure to have `latexmk`, a [Perl](http://www.perl.org/) script, which automates the process of compiling a LaTeX document installed. [Perl](http://www.perl.org/) script, which automates the process of compiling a LaTeX document. _Note that as v4.61 has minor bugs it has to be overriden<a href="#note1" id="note1ref" title="Override with v4.61+."><sup>1</sup></a> with the version provided in `editor-cfg/`._

Recreate the `demo-asbook` example:

    ../editor-cfg/build alpha

You should find `thesis-<stage>.pdf` in folder `out/`:

    $ ls out/
    thesis-alpha.fls         thesis-alpha.pdf         thesis-alpha.synctex.gz

To build the final version that is to be distributed via emails run:

    ../editor-cfg/build gold

To build the final version that is to be printed and bookbound run:

    ../editor-cfg/build press

The build script optional parameter `<stage>` specifies the stage of the manuscript, which determines the formatting of the generated PDF:

* `pre-alpha`: early drafts - no chapter thumbs, increased font when printed fit to page,
* `alpha`: for review by advisor - no chapter thumbs, increased font when printed fit to page,
* `beta`: for seminar 5 - no chapter thumbs, increased font when printed fit to page,
* `gamma`: for senate approval - no chapter thumbs, _includes rebuttal_ __TODO__,
* `gold`: final approved version - rebuttal not displayed, chapter pages in colour, chapter thumbs,
* `press`: for print - coverpage + gold - with trim marks for the bookbinder.

If the `<stage>` parameter is ommitted the build script will generate the PDF in the stage that is specified in the main TeX file when the `FRIteza` document class is loaded, in the case of `demo-asbook/thesis.tex`:

    \documentclass[language=english,stage=gold]{FRIteza}

Note that in this case the folder `out/` will contain files without the stage related suffix:

    $ ls out/
    thesis.fls         thesis.pdf         thesis.synctex.gz

### Starting to write your own doctoral dissertation

Copy `demo-empty` to a folder of your choosing, e.g. `dissertation`:

    cp -r demo-empty/ dissertation/

Make sure that a `latexmk` config file named `.latexmkrc` and Visual Studio Code config folder named `.vscode/` are present in your working folder:

    $ ls -al dissertation/
    drwxr-xr-x  22 iTZ  staff    704 27 Feb 19:53 .
    drwxr-xr-x  23 iTZ  staff    736 27 Feb 22:01 ..
    -rw-r--r--   1 iTZ  staff    681 27 Feb 19:53 .latexmkrc
    drwxr-xr-x   3 iTZ  staff     96 27 Feb 19:53 .vscode
    ...

The main TeX file is `thesis.tex`, the other TeX files are individual chapters. The folder `img/` contains the images.

### Using an IDE

We suggest the use of [TeXstudio](https://texstudio.sourceforge.net) or [Visual Studio Code](https://code.visualstudio.com) with the [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) extension.<a href="#note2" id="note2ref" title="Both are available for Windows, Linux and macOS."></sup>2</sup></a> Note that the provided IDE configurations are, like the build script, based on `latexmk`, so make sure it is installed.

#### TeXstudio

Configure TeXstudio

    Options > Load profile > thesis-BDR/editor-cfg/FRIteza.txsprofile

Recreate the `demo-asbook` example:

    File > Open > thesis-BDR/demo-asbook/thesis.tex
    Tools > Build & View

Note that this will generate `out/thesis.pdf` in the stage that is specified when the `FRIteza` document class is loaded. For further information please refer to the official [TeXstudio User Manual](http://texstudio.sourceforge.net/manual/current/usermanual_en.html). 

#### Visual Studio Code with LaTeX Workshop extension

Recreate the `demo-asbook` example:

    File > Open > thesis-BDR/demo-asbook/

In the side bar select `thesis.tex` to open it. A TeX action should appear in the activity bar. Use it to view the list ov available commands, and choose `Recipe: latexmk`. This is the default build command, which Visual Studio Code will run automaticaly upon modification of any of the constituiting files. It will generate `out/thesis.pdf` in the stage that is specified when the `FRIteza` document class is loaded. Additional recipes are provided, that will generate the PDF in the specific stage, as the command line build script, they will create files named `out/thesis-<stage>.pdf`. For further information please refer to the official [Visual Studio Code](https://code.visualstudio.com/docs) and [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) documentation.

#### Overleaf

A script is provided that packs all the requisite files into a single `zip` that can be uploaded to Overleaf. Note that there are certain limitations of using a free overleaf account, most notably a compile time out limit and a file number limit. For example the demo-bypub can not be uploaded on a free account, and with demo-asbook one can occasionally receive a compile time out error.

Pack all necessay files for Overleaf<a href="#note3" id="note3ref" title="A free Overleaf account has a timeout limit."></sup>3</sup></a></sup>,</sup><a href="#note4" id="note4ref" title="Overleaf has a 50MB upload limit."></sup>4</sup></a></sup>,</sup><a href="#note5" id="note5ref" title="Avoid using accented characters in file names."></sup>5</sup></a>:

     cd thesis-BDR
     pack-overleaf demo-asbook

You should find `demo-asbook.zip` in `overleaf/`

    $ ls overleaf/
    demo-asbook.zip

Upload `demo-asbook.zip` to Overlaf:

Change the compiler to `XeLaTeX`.<a href="#note6" id="note6ref" title="In the background Overleaf actually uses 'latexmk'.">

<!--
Unpack overleaf _TODO_??

### Tips'n'Tricks
-->

***

<a id="note1" href="#note1ref"><sup>1</sup></a>Note that there is a minor bug in `latexmk.pl` specific to our use case. The script's author has already been contacted, but until a new version is released you should override the current version (v4.61) wih the modified version (v4.61+) that is provided in `editor-cfg/`. Depending on your OS you should copy `latexmk.pl` into `C:\Program Files\MiKTeX 2.9\scripts\latexmk\` (Windows), `~/.miktex/texmfs/install/scripts/latexmk/` (Linux), or `~/Library/Application Support/MiKTeX/texmfs/install/scripts/latexmk/` (macOS). 

<a id="note2" href="#note2ref"><sup>2</sup></a>Both are available for Windows, Linux and macOS.

<a id="note3" href="#note3ref"><sup>3</sup></a>A free Overleaf account has a timeout limit, depending on the complexity of your manuscript you may occasionaly recieve a compile time out error.

<a id="note4" href="#note4ref"><sup>4</sup></a>Overleaf has a 50MB upload limit, for this reason the `demo-bypub` can be uploaded only partially, e.g. excluding the `img_HQ/` folder, which can than be uploaded into the project on an individual file basis. Overleaf support has already been contacted and we are trying to find a solution.

<a id="note5" href="#note5ref"><sup>5</sup></a>Avoid using accented characters in file names as these may cause issues in multi-platform settings.

<a id="note6" href="#note6ref"><sup>6</sup></a>In the background Overleaf actually uses `latexmk`.
