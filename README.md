pdf-to-images
=============

Easily convert pages of a PDF to PNG images on a Mac terminal  

Requires ImageMagick to be installed (http://www.imagemagick.org/script/install-source.php)  

To use:  
```
chmod u+x convert-pdf-to-images.sh
./convert-pdf-to-images.sh PDF_PATH OUTPUT_DIR IMAGE_FILE_NAME
```
Example use:
```
./convert-pdf-to-images.sh ~/Documents/myDoc.pdf ~/myDocImages my-doc-page
```
Will output each page of pdf as my-doc-page-0.png, my-doc-page-1.png in ~/myDocImages directory
