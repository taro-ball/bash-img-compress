export SOURCE="/x/photo/2020"
export DESTINATION="/d/photo_out/"
export iMGK_PATH="/c/Users/paw/scoop/apps/imagemagick/current"
# find $SOURCE -maxdepth 1 -mindepth 1 -type d -printf '%f\n'
raw_dirs=`find $SOURCE -maxdepth 1 -type d`
all_dirs=`echo "${raw_dirs}" | grep 2020.0[7-8]`
echo "${all_dirs}"

while IFS= read -r di; do
    dir=${di%*/}      # remove the trailing "/"
    echo "==============================="
    cd "$dir"
    pwd
    out_path=$DESTINATION${dir##*/}
    mkdir "$out_path"
    find * -maxdepth 0 -type f -iregex '.*jpg' -print0 |
    while IFS= read -r -d '' file; do
        #printf '%s\n' "$file"

        # -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace RGB
        if [ ! -f "$out_path/$file" ];
        then
            echo processing $file...
            convert_cmd="$iMGK_PATH/convert $file -resize 2222x2222 -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace RGB \"$out_path/$file\""
            eval "$convert_cmd"
        else
            echo "$file exists, skipping"
        fi

    done
done <<< "${all_dirs}"
