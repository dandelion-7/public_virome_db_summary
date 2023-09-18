# !/usr/bin/bash

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Following script 1, this script extracts the human-associated UViGs from IMGVR_all_nucleotides with the list from script 1 through seqtk.
# Last modified: 23-9-13.
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INPUT=~/crisprome/virome_database/raw_databases/7.IMG_VR/IMG_VR/IMG_VR_2022-12-19_7/IMGVR_all_nucleotides.fna
LIST=~/crisprome/virome_database/intermediates/1.IMGVR_summary/1-2.uvigs_names_possible_human_associated.txt
OUTPUT=~/crisprome/virome_database/intermediates/2.extract_IMGVR_human_uvigs/uvigs_IMGVR_human_associated.fasta
mkdir -p ~/crisprome/virome_database/intermediates/2.extract_IMGVR_human_uvigs

source activate seqtk
seqtk subseq ${INPUT} ${LIST} > ${OUTPUT}
conda deactivate

cp ${INPUT} ~/crisprome/virome_database/blastdb/7.uvigs_IMGVR_human_associated.fasta
