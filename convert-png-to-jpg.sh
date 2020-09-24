#!/bin/bash
IFS=$'\n'
clear
mkdir "$HOME/jpgPictures"
image_name="1"
images=`ls $HOME/Pictures/*png`
for i in $images;do
	convert "$i" -resize 50% "$HOME/jpgPictures/$image_name.jpg"
	echo "$image_name.jpg created!"
	((image_name++))
done
echo "Finished."
