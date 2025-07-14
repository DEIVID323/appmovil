#!/bin/bash
find lib/ -name "*.dart" -print0 | while read -d $'\0' file; do
    name="$(basename ${file})"
    grep -rn -F -q "${name}" lib/
    if [ $? -ne 0 ]; then
        echo "Unused file: ${file}"
    fi
done
