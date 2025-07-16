#!/bin/bash

# Create output directory for ASCII files if it doesn't already exist
mkdir -p MillionSongSubset_ASCI_analysis_songs

# Loop through all .h5 files in the MillionSongSubset directory (three levels deep)
for file in MillionSongSubset/*/*/*/*.h5; do
    # Extract the filename without path and extension
    filename=$(basename -- "$file")
    filename_without_extension="${filename%.*}"

    # Use h5dump to extract only the 'songs' dataset from the '/analysis' group
    # and write the output in ASCII format
    h5dump -o "MillionSongSubset_ASCI_analysis_songs/${filename_without_extension}_songs.asci" -y -w 400 -d /analysis/songs "$file"
done
