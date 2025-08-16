#!/bin/bash

# Folder paths relative to the script's location
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
FOLDER1="$SCRIPT_DIR/"
FOLDER2="$SCRIPT_DIR/[previews]"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo "🔍 Comparing files in:"
echo "📁 Folder1: $FOLDER1"
echo "📁 Folder2: $FOLDER2"
echo ""

# Loop through all files in Folder1
for file1 in "$FOLDER1"/*; do
    [[ -f "$file1" ]] || continue
    name1=$(basename "$file1")
    base1="${name1%.*}"

    echo $name1

    # Loop through all files in Folder2
    for file2 in "$FOLDER2"/*; do
        [[ -f "$file2" ]] || continue
        name2=$(basename "$file2")

        # ⛔️ Exclude: Files with [TrackData] in the name
        if [[ "$name2" == *"[TrackData]"* ]]; then
            echo -e "⏭️  Skipping: $name2 (contains [TrackData])"
            continue
        fi

        base2="${name2%.*}"
        ext2="${name2##*.}"

        if [[ "$base1" == "$base2" ]]; then
            newname="${name1}.${ext2}"
            mv "$file2" "$FOLDER2/$newname"
            echo -e "${GREEN}✅ Renamed:${NC} $name2 → $newname"
        fi
    done
done
read -p "🔚 Press [Enter] to close the window..."

echo ""
echo "🏁 Done!"
