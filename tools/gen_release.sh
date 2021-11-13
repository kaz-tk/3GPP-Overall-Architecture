#!/bin/bash
FNAME=3GPP_Overall_Architecture_and_Specifications
apt-get install -y libreoffice imagemagick

libreoffice7.1 --headless --convert-to pdf ${FNAME}.pptx

echo "pptx to PDF phase"

while $(/bin/true)
do
  if [ -e "${FNAME}.pdf" ];then
    echo pdf file found
    sleep 5
    break
  fi
done

echo "PDF to image phase"
cp tools/policy.xml /etc/ImageMagick-6/ || :
convert -density 400 -resize 3000^ ${FNAME}.pdf ${FNAME}.png
convert -density 400 -resize 3000^ ${FNAME}.pdf ${FNAME}.jpg


