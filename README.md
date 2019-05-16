[![Release](https://img.shields.io/github/release/UL-FRI/thesis-BDR.svg?style=flat-square)](https://img.shields.io/github/release/UL-FRI/thesis-BDR)

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

    mpm --require=@packages.txt
    79 packages have been successfully installed.

Make sure to initialize all the selected languages (Slovene and UK English):

    initexmf --mklangs
    initexmf --dump
    initexmf --dump  # has to be run twice

Make sure to have `latexmk`, a [Perl](https://www.perl.org/) script, which automates the process of compiling a LaTeX document, installed. Follow [the tutorial](https://mg.readthedocs.io/latexmk.html) for your platform.

Recreate the `demo-asbook` example:

    cd demo-asbook
    ../editor-cfg/build alpha

You should find `thesis-<stage>.pdf` in folder `out/`:

    ls out/
    thesis-alpha.fls         thesis-alpha.pdf         thesis-alpha.synctex.gz

To build the final version that is to be distributed via emails run:

    ../editor-cfg/build gold

To build the final version that is to be (printed and) sent to the bookbinder run:

    ../editor-cfg/build press

The build script optional parameter `<stage>` specifies the stage of the manuscript, which determines the formatting of the generated PDF:

* `pre-alpha`: early drafts - no chapter thumbs, increased font when printed fit to page,
* `alpha`: for review by advisor - no chapter thumbs, increased font when printed fit to page,
* `beta`: for seminar 5 - no chapter thumbs, increased font when printed fit to page,
* `gamma`: for senate approval - no chapter thumbs, _includes rebuttal_ __TODO__,
* `gold`: final approved version - rebuttal not displayed, chapter pages in colour, chapter thumbs,
* `press`: for print - coverpage + gold - with trim marks for the bookbinder.

If the `<stage>` parameter is omitted the build script will generate the PDF in the stage that is specified in the main TeX file when the `FRIteza` document class is loaded, in the case of `demo-asbook/thesis.tex`:

    \documentclass[language=english,stage=gold]{FRIteza}

Note that in this case the folder `out/` will contain files without the stage related suffix:

    ls out/
    thesis.fls         thesis.pdf         thesis.synctex.gz

### Starting to write your own doctoral dissertation

Copy `demo-empty` to a folder of your choosing, e.g., `dissertation`:

    cp -r demo-empty/ dissertation/

Make sure that a `latexmk` config file named `.latexmkrc` and Visual Studio Code config folder named `.vscode/` are present in your working folder:

    ls -al dissertation/
    drwxr-xr-x  22 iTZ  staff    704 27 Feb 19:53 .
    drwxr-xr-x  23 iTZ  staff    736 27 Feb 22:01 ..
    -rw-r--r--   1 iTZ  staff    681 27 Feb 19:53 .latexmkrc
    drwxr-xr-x   3 iTZ  staff     96 27 Feb 19:53 .vscode
    ...

The main TeX file is `thesis.tex`, the other TeX files are individual chapters. The folder `img/` contains the images.

#### Thesis ID on cover page

After your doctoral dissertation is approved by the UL FRI Senate, you will receive a dissertation `ID` (a number in decimal format). Place the `ID` in your `thesis.tex` file. Look for the line with command `\spine{<ID>}` and replace the `<ID>` with your `ID` (in decimal format). Rebuild with stages `gold` and `press`. The gold version is intended for email distribution and upload to digital repositories. The press version includes a cover page with the thesis `ID` (shown in hexadecimal) and is intended for printing and bookbinding.

### Using an IDE

We suggest the use of [TeXstudio](https://texstudio.sourceforge.net) or [Visual Studio Code](https://code.visualstudio.com) with the [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) extension.<a href="#note1" id="note1ref" title="Both are available for Windows, Linux and macOS."><sup>1</sup></a> Note that the provided IDE configurations are, like the build script, based on `latexmk`, so make sure it is installed.

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

In the side bar select `thesis.tex` to open it. A TeX action should appear in the activity bar. Use it to view the list of available commands, and choose `Recipe: latexmk`. This is the default build command, which Visual Studio Code will run automatically upon modification of any of the constituting files. It will generate `out/thesis.pdf` in the stage that is specified when the `FRIteza` document class is loaded. Additional recipes are provided, that will generate the PDF in the specific stage, as the command line build script, they will create files named `out/thesis-<stage>.pdf`. 

![VScode compile](https://github.com/UL-FRI/thesis-BDR/raw/master/editor-cfg/VScode_compile.gif "VScode compile")

For further information please refer to the official [Visual Studio Code](https://code.visualstudio.com/docs) and [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) documentation.

#### Overleaf

A script is provided that packs all the requisite files into a single `zip` that can be uploaded to Overleaf. Note that there are certain limitations of using a free overleaf account, most notably a compile time out limit and a file number limit. For example the `demo-bypub` can not be uploaded on a free account, and with `demo-asbook` one can occasionally receive a compile time out error.

Pack all necessary files for Overleaf<a href="#note2" id="note2ref" title="A free Overleaf account has a timeout limit."><sup>2</sup></a><sup>,</sup><a href="#note3" id="note3ref" title="Overleaf has a 50MB upload limit."><sup>3</sup></a><sup>,</sup><a href="#note4" id="note4ref" title="Avoid using accented characters in file names."><sup>4</sup></a>. For example, you may try to recreate the `demo-asbook` on Overleaf:

    cd thesis-BDR
    editor-cfg/pack-overleaf demo-asbook

You should find `demo-asbook.zip` in `overleaf/`

    ls overleaf/
    demo-asbook.zip

Upload `demo-asbook.zip` to Overleaf.

![Upload to Overleaf](https://github.com/UL-FRI/thesis-BDR/raw/master/editor-cfg/Overleaf_upload_zip.gif "Upload to Overleaf")

Change the compiler to `XeLaTeX`.<a href="#note5" id="note5ref" title="In the background Overleaf actually uses 'latexmk'."><sup>5</sup></a>

![Overleaf compiler](https://github.com/UL-FRI/thesis-BDR/raw/master/editor-cfg/Overleaf_XeLaTeX.gif "Overleaf compiler")

<!--
Unpack overleaf _TODO_??

### Tips'n'Tricks
-->

***

<a id="note1" href="#note1ref"><sup>1</sup></a>Both are available for Windows, Linux and macOS.

<a id="note2" href="#note2ref"><sup>2</sup></a>A free Overleaf account has a timeout limit, depending on the complexity of your manuscript you may occasionally receive a compile time out error.

<a id="note3" href="#note3ref"><sup>3</sup></a>Overleaf has a 50MB upload limit, for this reason the `demo-bypub` can be uploaded only partially, e.g. excluding the `img_HQ/` folder, which can than be uploaded into the project on an individual file basis. Overleaf support has already been contacted and we are trying to find a solution.

<a id="note4" href="#note4ref"><sup>4</sup></a>Avoid using accented characters in file names as these may cause issues in multi-platform settings.

<a id="note5" href="#note5ref"><sup>5</sup></a>In the background Overleaf actually uses `latexmk`.
