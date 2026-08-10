#!/bin/bash
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"

EN_DATE=$(git -C "$DIR" log -1 --format=%cd --date=format:'%B %Y' 2>/dev/null || echo "August 2026")
YEAR=$(git -C "$DIR" log -1 --format=%cd --date=format:'%Y' 2>/dev/null || echo "2026")
MONTH=$(git -C "$DIR" log -1 --format=%cd --date=format:'%m' 2>/dev/null || echo "08")

MONTH_NUM=$((10#$MONTH))
ZH_DATE="${YEAR}年${MONTH_NUM}月"

sed -i '' "s|<span id=\"lastUpdated\">[^<]*</span>|<span id=\"lastUpdated\">${EN_DATE}</span>|g" "$DIR/index.html"
sed -i '' "s|<span id=\"lastUpdated\">[^<]*</span>|<span id=\"lastUpdated\">${ZH_DATE}</span>|g" "$DIR/index-zh.html"

echo "Done: EN='${EN_DATE}'  ZH='${ZH_DATE}'"
