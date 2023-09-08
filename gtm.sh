#!/bin/bash
#
# Extract Google Tag Manager items.
#
# DEPENDS       :apt-get install wget jq

MEASUREMENT_ID="$1"

set -e

grep -E '^[A-Z]+-[0-9A-Z]{8,}$' <<<"${MEASUREMENT_ID}"

if [ "${MEASUREMENT_ID:0:4}" == "GTM-"; then
    wget -O "${MEASUREMENT_ID}.js" "https://www.googletagmanager.com/gtm.js?id=${MEASUREMENT_ID}"
else
    wget -O "${MEASUREMENT_ID}.js" "https://www.googletagmanager.com/gtag/js?id=${MEASUREMENT_ID}"
fi

# Extract JSON object
cat "${MEASUREMENT_ID}.js" \
    | sed -e '/^var data = {$/,/^};$/!d' \
    | sed -e '1s/^var data = //;$s/;$//' \
    >"${MEASUREMENT_ID}.json"

# Display JavaScript events on elements with a certain HTML class
#jq -r '."resource"."predicates"[] | select(."function" == "_cn") | ."arg1"' "${MEASUREMENT_ID}.json"

# Display all tags
jq -r '."resource"."tags"[]' "${MEASUREMENT_ID}.json"
