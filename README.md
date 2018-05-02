# bib2word docker container

This is a simple docker container to convert bibtex bibliographies to XML files compatible with Microsoft Word using the [`bibutils`](https://sourceforge.net/p/bibutils/home/Bibutils/) tools.

## Setup

Simple create the docker image using the `Dockerfile` provided:

```bash
docker build -t bib2word --rm .
```

_Note_: on Windows, ensure that you checked out the files using LF line endings (if `bib2word.sh` contains CLRF, the script won't run).

## Run

The container comes with a `bib2word` script that does the job. Just run the container, specifying the file(s) you want to convert.

For example, to convert `biblio.tex` into `biblio.xml` (that you can then import using the Microsoft Word wizard), use the following snippet:

* On linux: 
    ```bash
    docker run --rm -v $(pwd):/app bib2word biblio.tex
    ```
* On windows cmd: 
    ```bash
    docker run --rm -v %cd%:/app bib2word biblio.tex
    ```
* On windows powershell:  
    ```bash
    docker run --rm -v ${pwd}:/app bib2word biblio.tex
    ```

_Note_: he `-v` command will mount the current directory (containing the `biblio.bib` to convert) into the container. After execution, `biblio.xml` will be present in your current directory.


## About Microsoft bibliography

To import references/sources into a word document:

* under _References_, click on _Manage Sources_;
* in the dialog, use the _Browse..._ button and select your `.xml` file;
* Transfer the entries from the _Master list_ to the _Current list_ by selecting everything from the right side list and clicking _Copy ->_;
* Close the dialog.

To create a reference in your document:

* put the cursor where you want the reference to show;
* under _References_, select the style you want to use (`IEEE` for the standard `[x]` format);
* click _Insert citation_ and select the source you want to reference.