#!/bin/bash

# Change to the directory of the script
cd -P -- "$(dirname -- "$0")" || exit 1

RUN_FROM="./php"

# Download the PHP script if it doesn't exist
if [ ! -f "$RUN_FROM" ]; then
    wget --no-check-certificate -O "$RUN_FROM" https://raw.githubusercontent.com/GrootBlouNaai/wine-helpers/master/php || {
        echo "Failed to download PHP script" >&2
        exit 1
    }
fi

# Ensure the PHP script is executable
chmod +x "$RUN_FROM" || {
    echo "Failed to make PHP script executable" >&2
    exit 1
}

# Remove the restart file if it exists
[ -f "./restart" ] && rm "./restart"

# Function to run the PHP script
run_php() {
    tail -n +37 ./start > "$(pwd -P)/start-tmp" 2> >(grep -v "no version information available" 1>&2) || {
        echo "Failed to create temporary start file" >&2
        exit 1
    }
    "$RUN_FROM" -f "$(pwd -P)/start-tmp" "$@" 2> >(grep -v "no version information available" 1>&2) || {
        echo "PHP script execution failed" >&2
        exit 1
    }
}

# Run the PHP script initially
run_php "$@"

# Loop to handle the restart file
while [ -f "./restart" ]; do
    rm "./restart" || {
        echo "Failed to remove restart file" >&2
        exit 1
    }
    run_php "$@"
done

exit 0
