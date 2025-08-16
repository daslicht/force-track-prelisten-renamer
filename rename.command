#!/bin/bash

# Ordnerpfade relativ zum Speicherort des Skripts
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ORDNER1="$SCRIPT_DIR/"
ORDNER2="$SCRIPT_DIR/[previews]"

# Farben für Ausgabe
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo "🔍 Vergleiche Dateien in:"
echo "📁 Ordner1: $ORDNER1"
echo "📁 Ordner2: $ORDNER2"
echo ""

# Durchlaufe alle Dateien in Ordner1
for file1 in "$ORDNER1"/*; do
    [[ -f "$file1" ]] || continue
    name1=$(basename "$file1")
    base1="${name1%.*}"

    echo $name1

    # Durchlaufe alle Dateien in Ordner2
    for file2 in "$ORDNER2"/*; do
        [[ -f "$file2" ]] || continue
        name2=$(basename "$file2")

        # ⛔️ Ausschluss: Dateien mit [TrackData] im Namen
        if [[ "$name2" == *"[TrackData]"* ]]; then
            echo -e "⏭️  Überspringe: $name2 (enthält [TrackData])"
            continue
        fi

        base2="${name2%.*}"
        ext2="${name2##*.}"

        if [[ "$base1" == "$base2" ]]; then
            newname="${name1}.${ext2}"
            mv "$file2" "$ORDNER2/$newname"
            echo -e "${GREEN}✅ Umbenannt:${NC} $name2 → $newname"
        fi
    done
done
read -p "🔚 Drücke [Enter], um das Fenster zu schließen..."

echo ""
echo "🏁 Fertig!"
