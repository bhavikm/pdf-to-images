#!/bin/bash

#Must have 3 arguments
if [[ $# < 3 ]]
  then
    echo "Usage is: ./convert-images.sh PDF_PATH OUTPUT_DIR IMG_FILE_NAME"
    exit
else
  #check if pdf file exists
  if [ -f "$1" ]
    then
    	pdf_path="$1"
    else
    	echo "PDF file doesn't exist"
    	exit
  fi

  #if output directory doesn't exist make it
  if [ ! -d "$2" ]
  	then
   		mkdir -p "$2"
  fi
  output_dir="$2"

  #set output image file name
  img_file_name="$3"
fi

#use ImageMagick to convert each pdf page as a png with 150 pixels per inch
convert -density 150 "$pdf_path" "${output_dir}/${img_file_name}".png

#how many pages did we convert from pdf
page_count=`ls ${output_dir} | wc -l`

#go over each converted page, flatten it (adds white background) and then resize each image to width of 768 pixels
for (( i=0; i<$page_count; i++ ))
do
  convert "${output_dir}/${img_file_name}"-${i}.png -flatten "${output_dir}/${img_file_name}"-${i}.png
  convert "${output_dir}/${img_file_name}"-${i}.png -resize 768 "${output_dir}/${img_file_name}"-${i}.png
done
