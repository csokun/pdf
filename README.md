# Pdf Utilities

## Merge multiple images into PDF

```bash
convert image1.png image2.png output.pdf
# or
ls *.png | xargs -I% convert % %.pdf
# or
convert "*.{png}" -rotate 90 -page a4 -quality 80 output.pdf
```

## Reduce Filesize
ref. https://askubuntu.com/questions/113544/how-can-i-reduce-the-file-size-of-a-scanned-pdf-file

```bash
gs -sDEVICE=pdfwrite \
    -dCompatibilityLevel=1.4 \
    -dPDFSETTINGS=/screen \
    -dNOPAUSE \
    -dQUIET \
    -dBATCH  \
    -sPAPERSIZE=a4 \
    -dColorImageDownsampleType=/Bicubic \
    -dColorImageResolution=72 \
    -dGrayImageDownsampleType=/Bicubic \
    -dGrayImageResolution=72 \
    -dMonoImageDownsampleType=/Bicubic \
    -dMonoImageResolution=72 \
    -sOutputFile=output.pdf input.pdf
```