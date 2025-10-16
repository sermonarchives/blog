#!/bin/bash

# A script to automate the creation of a new sermon post.
#
# Usage: ./newSermon.sh "Sermon Title" [SermonNumber]
# If SermonNumber is omitted, it will be auto-incremented from the last one.
#
# This script will:
# 1. Create a new sermon markdown file using the archetype.
# 2. Create a corresponding directory in /static/images/sermons/.
# 3. Copy any images (.jpg, .jpeg, .png, .gif) from the project root to the new directory.
# 4. Append a <figure> shortcode for each image to the new markdown file.
# 5. Delete the original images from the root.

# ---

# Check for at least one argument (Title)
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 \"Sermon Title\" [SermonNumber]"
    echo "If SermonNumber is omitted, it will be auto-incremented."
    exit 1
fi

TITLE=$1
NUMBER=$2
YEAR=$(date +%Y)

# --- Auto-increment logic ---
if [ -z "$NUMBER" ]; then
    echo "Sermon number not provided. Finding the latest sermon number..."
    # Find the highest 4-digit directory name in static/images/sermons
    # The `2>/dev/null` suppresses errors if no directories are found
    LATEST_NUMBER=$(ls -d static/images/sermons/[0-9][0-9][0-9][0-9] 2>/dev/null | sed 's/.*\///' | sort -n | tail -n 1)

    if [ -z "$LATEST_NUMBER" ]; then
        echo "Could not find any existing sermon directories. Starting with 0001."
        NUMBER="0001"
    else
        # Increment the number, preserving leading zeros
        # The 10# is crucial to prevent bash from treating numbers like '0100' as octal
        NEXT_NUMBER=$((10#$LATEST_NUMBER + 1))
        NUMBER=$(printf "%04d" $NEXT_NUMBER)
        echo "Found latest number: $LATEST_NUMBER. New number will be: $NUMBER"
    fi
fi
# --- End auto-increment logic ---


# Sanitize title for filename (lowercase, spaces to hyphens)
FILENAME_TITLE=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')

# Construct the full paths
MARKDOWN_PATH="content/sermons/${FILENAME_TITLE}-${YEAR}-${NUMBER}.md"
IMAGE_DIR="static/images/sermons/${NUMBER}"

# 1. Create the new sermon markdown file using hugo new
echo "Creating new sermon: ${MARKDOWN_PATH}"
hugo new "${MARKDOWN_PATH}"

# Check if hugo new was successful
if [ ! -f "$MARKDOWN_PATH" ]; then
    echo "Error: Failed to create sermon file. Does the 'content/sermons' directory exist?"
    exit 1
fi

# 2. Create the corresponding image directory
echo "Creating image directory: ${IMAGE_DIR}"
mkdir -p "${IMAGE_DIR}"

# 3. Find, copy, and process images from the root directory
echo "Looking for images in the root directory..."
shopt -s nullglob
IMAGES=(*.jpg *.jpeg *.png *.gif)

if [ ${#IMAGES[@]} -eq 0 ]; then
    echo "No images found in the root directory. Script finished."
else
    for IMG in "${IMAGES[@]}"; do
        echo "  - Processing image: $IMG"

        # Copy image to the new directory
        cp "$IMG" "${IMAGE_DIR}/"
        echo "    ...copied to ${IMAGE_DIR}/"

        # Append figure shortcode to the markdown file
        FIGURE_PATH="/images/sermons/${NUMBER}/${IMG}"
        SHORTCODE="{{< figure src=\"${FIGURE_PATH}\" width=\"1080\" >}}"
        # Add a newline before the shortcode for better formatting
        echo "" >> "${MARKDOWN_PATH}"
        echo "${SHORTCODE}" >> "${MARKDOWN_PATH}"
        echo "    ...appended shortcode to ${MARKDOWN_PATH}"

        # Remove the original image
        rm "$IMG"
        echo "    ...removed original image from root."
    done
fi

echo ""
echo "Sermon creation process complete!"