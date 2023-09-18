# !/usr/bin/bash

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Following script 3, build blast database with the collected virome datasets.
# Last modified: 23-9-13.
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------

cd ~/crisprome/virome_database/blastdb

echo "HuVirDB"
makeblastdb -in 1.HuVirDB-1.0.fasta -dbtype nucl -input_type fasta -out ./HuVirDB -title HuVirDB

echo "merged virus sequences"
makeblastdb -in 2-7.virus_sequences.fasta -dbtype nucl -input_type fasta -out ./virus_sequences -title virus_sequences

echo "plasmid sequences"
makeblastdb -in plasmid_seq.fna -dbtype nucl -input_type fasta -out ./plasmid_seq -title plasmid_seq
