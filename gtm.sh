#!/bin/bash
#
# Extract Google Tag Manager items.
#
# DEPENDS       :apt-get install wget jq

TAG_ID="$1"

set -e

grep -E '^[A-Z]+-[0-9A-Z]{6,}$' <<<"${TAG_ID}"

if [ "${TAG_ID:0:4}" == "GTM-" ]; then
    wget -O "${TAG_ID}.js" "https://www.googletagmanager.com/gtm.js?id=${TAG_ID}"
else
    wget -O "${TAG_ID}.js" "https://www.googletagmanager.com/gtag/js?id=${TAG_ID}"
fi

# Extract JSON object
# shellcheck disable=SC2002
cat "${TAG_ID}.js" \
    | sed -e '/^var data = {$/,/^};$/!d' \
    | sed -e '1s/^var data = //;$s/;$//' \
    >"${TAG_ID}.json"

# Display JavaScript events on elements with a certain HTML class
#jq -r '."resource"."predicates"[] | select(."function" == "_cn") | ."arg1"' "${TAG_ID}.json"

# Display all tags
jq -r '."resource"."tags"[]' "${TAG_ID}.json"
