#!/bin/bash

echo "Prepare output folders"
mkdir -p images
mkdir -p cropped
rm images/*
rm cropped/*

echo "PDF to PNG"
pdftoppm -png Magicraft.pdf images/Magicraft

# # offsets
# XS=(38 413 788)
# YS=(38 563 1088)

# echo "Crop image into cards"
# for image in `ls images/`; do
#   echo "  processing $image"
#   for x in ${XS[@]}; do
#     for y in ${YS[@]}; do
#       convert -crop 375x525+$x+$y  images/$image cropped/$x-$y-$image
#     done
#   done
# done

# echo "Remove blank images"
# # assumed blank if top left pixel is white
# for cropped_image in `ls cropped/`; do
#   img_path=cropped/$cropped_image
#   out=$(convert $img_path -resize 1x1\! -format "%[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)]" info:-)
#   if [ "$out"  == "255,255,255" ]; then
#     rm $img_path
#   fi
# done

echo "Done!"
echo "Generated cards: $(ls images | wc -l)"

# TODO: Create a card sheet (see pipeline.jl)
