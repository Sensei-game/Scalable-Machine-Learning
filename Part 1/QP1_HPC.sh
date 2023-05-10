#!/bin/bash
#$ -l h_rt=2:00:00  #time needed 6:00:00
#$ -P rse-com6012 # use the reserved queue in batch mode
#$ -pe smp 10 #number of cores 2   2vCPU, 7.5GB RAM, to 4vCPU 15GBRAM (Some parquet file were created but job never complete, hence I increase to 8vCPU 32GB RAM (everything now work)
#$ -l rmem=20G #number of memery 8G , 10G
#$ -o ../Output/QP1_Output_10Core.txt  #This is where your output and errors are logged.
#$ -j y # normal and error outputs into a single file (the file above)
#$ -M SBeregszaszi1@sheffield.ac.uk #Notify you by email, remove this line if you don't like
#$ -m ea #Email you when it finished or aborted
#$ -cwd # Run job from current directory

module load apps/java/jdk1.8.0_102/binary 

module load apps/python/conda 

source activate myspark 

spark-submit --driver-memory 20g --executor-memory 20g ../Code/QP1_code.py  