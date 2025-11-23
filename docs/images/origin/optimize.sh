#!/bin/bash
command -v convert &> /dev/null || exit 1

shopt -s nullglob
png_files=(*.png)
[ ${#png_files[@]} -eq 0 ] && exit 1

output_dir=".."

for file in *.png; do
    filename="${file%.png}"
    convert "$file" -resize 1024x "$output_dir/${filename}.webp" 2>/dev/null
done
