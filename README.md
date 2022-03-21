# Custom docker image for Catmandu command line tool

1. Download and install [Docker](https://docs.docker.com/get-started/#download-and-install-docker)
2. Build the image `docker build -t custom/catmandu .`
3. Run the image with mounted host directory:
   - `docker run -it -v $(pwd)/data:/home/catmandu/data custom/catmandu` on Linux
   - `docker run -it -v ${PWD}/data:/home/catmandu/data custom/catmandu` in Powershell
   - `docker run -it -v %cd%/data:/home/catmandu/data custom/catmandu` in Windows Command Line (`cmd`)
4. Run the command `catmandu convert MARC --type XML --fix "marc_map(100a,name); replace_all(name, ',$', ''); retain(_id, name)" to CSV --fields "_id,name" < data/test.xml > data/output.csv`

   You should receive the following output in `data/output.csv`:

```
_id,name
jk01010001,"Abraham, Jiří"
jk01010002,"Abraham, Josef"
jk01010003,"Abraham, Pavel"
jk01010004,"Absolon, Josef"
jk01010005,"Absolon, Karel"
```

5. Run the command with the fix file `catmandu convert MARC --type XML --fix data/test.fix to CSV --fields "_id,name,wikidata_id" < data/test.xml`

   You should receive the following output in your terminal:

```
_id,name,wikidata_id
jk01010001,"Abraham, Jiří",
jk01010002,"Abraham, Josef",
jk01010003,"Abraham, Pavel",
jk01010004,"Absolon, Josef",
jk01010005,"Absolon, Karel",Q1063371
```

For more in-depth use of the command line tool, see the [documentation](https://librecat.org/Catmandu/) and the [fix language cheat sheet](https://librecat.org/assets/catmandu_cheat_sheet.pdf).
