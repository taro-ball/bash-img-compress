export SOURCE="/x/photo/2020"
export DESTINATION="/d/photo_out"
# find $SOURCE -maxdepth 1 -mindepth 1 -type d -printf '%f\n'
raw_dirs=`find $SOURCE -maxdepth 1 -type d`
all_dirs=`echo "${raw_dirs}" | grep 2020.0[7-8] | grep -v baiduyun`
echo "${all_dirs}"

while IFS= read -r di; do
    dir=${di%*/}      # remove the trailing "/"
    echo "==============================="
    cd "$dir"
    pwd
    find . -type f -iname '*.j*' -maxdepth 1 -print0 | 
    while IFS= read -r -d '' file; do
        printf '%s\n' "$file"
    done
done <<< "${all_dirs}"
