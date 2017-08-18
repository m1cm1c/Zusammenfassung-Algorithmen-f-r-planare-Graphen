# README
You can build this readme file via:

    pandoc -f markdown -o README.pdf README.md

# Contents
This is a summary of the lecture "Algorithmen für planare Graphen" at KIT (Karlsruher Institut für Techonlogie). It does not represent everything said during the lectures, nor does it contain all of the topics. I do not claim it to be free of errors.

# Building
## First Build
Run the script `build.sh` to completely build the project. If there are errors or you just want to be sure, run it with the `-c` flag:

    ./build.sh -c

This calls the `clean.sh` script before building the PDF.

`clean.sh` removes all files ignored by git.

Building the PDF in a LaTeX editor or Emacs without having it build using the script first usually results in a missing glossary. The rest of the PDF should be fine.

If you prefer your top-level directory to stay clean, you may use the `dedicatedFolderBuild.sh` script which keeps all generated files in a dedicated folder called `Built`. Depending on your editor, this may partially break compatibility with building the PDF from within that editor(see paragraph above).


## Subsequent Builds
After the initial build, building a single time (e.g. by executing `pdflatex Document.tex`) is usually sufficient and siginifcantly faster than calling the build script. The build script, however, should be called after adding or removing glossary entries so they appear or disappear in the PDF.


# Writing
## The `\fig` Command
The `\fig` command is used to easily add images. Save images to the folder `Resources/Included Graphics` and choose a descriptive file name because the file name without file name extension will be the image's caption. These file names don't have to be short. All modern systems allow fairly long file names. Umlaute have to be ommitted, though, or the PDF won't build.

The command takes 2 arguments: The first one is the image's name without file name extension and the second one is the with of the image relative to the text width.

### Example

    \fig{Intel x86-64 Page Table Hierarchy}{.6}

displays the image `Resources/Included Graphics/Intel x86-64 Page Table Hierarchy.png` with the caption "Intel x86-64 Page Table Hierarchy".

### Referring to Images
You can refer to images as `fig:[caption]`. The necessary labels are created automatically.

#### Example

    \ref{Intel x86-64 Page Table Hierarchy}

### Image Formats
Please preferrably use the PNG format because it offers lossless compression.

When including an image you got in a format with lossy compression (e.g. JPEG, GIF), you may include it as such. If you edit the image, however, please save it as PNG.

Uncompressed images (e.g. BMP) should be converted to PNG before adding them.
