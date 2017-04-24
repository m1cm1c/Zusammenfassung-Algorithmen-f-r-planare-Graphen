# README
You can build this readme file via:

    pandoc -f markdown -o README.pdf README.md

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


## Rules
Rules are subject to change. If you think an existent rule is stupid or counter-productive or one is missing, tell me (michelbach94@gmail.com).

### General Rules
0. Don't share your account with others. Ask for a separate account for them if you want to invite others.
1. The document is in a single language except for good reason (like the first half of the lecture being in German and the second half of it being in English). Whether that's English or German should be evident if there already is content. The language usually is the language the lecture slides or the script are in so parts of it can easily be used in the summary.
2. You may write commit messages in English or in German, regardless of the language of the summary.
3. Small changes (like improving spelling/grammar which only takes a single commit) can be made directly on master.
4. When writing, branch out per set of slides / lecture / coherent topic / something else that makes sense. Don't work on `master` directly.
5. You can merge the branches into master when you feel like it. If you don't plan on using the branch any more after merging, please delete it from the shared repo.
6. Don't rebase; Use merge commits. If the merge is fast-forward, preferably use fast-forward merging (you may, however, use merge commits in any case). [If you don't know what "rebasing" or "fast-forward merging" means, don't worry about it. It's git's standard behavior.]
7. Code on master must compile. Don't push to master if it doesn't!
8. If you use Windows, the document compiles even if paths to external resources (like graphics) have incorrect capitalization because capitalization of paths doesn't matter on Windosw. However, it matters on all other systems. Please check whether you entered the paths correctly so the document can be built on different systems.
9. Push your changes frequently, even if you don't plan on merging yet. Don't keep commits offline. Code in branches other than `master` doesn't have to compile (can contain LaTeX errors).
10. Start a branch name with `protected-` if you don't want others to modify its contents as long as it isn't merged.
11. If a branch starts with `protected-`, don't modify its contents unless you created it. If it doesn't, you're free to do so.


### Content Rules
1. We're not trying to write a script. Only add stuff you think you or others won't remember from attending the lecture or reading through the slides. Stuff that's commonly known before attending the lecture or which is common sense, shouldn't be added.
