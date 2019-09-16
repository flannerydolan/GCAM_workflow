#!/bin/bash
#SBATCH --time=1-20:00:00
#SBATCH -p llab
#SBATCH --qos=lamontagne
#SBATCH -n 1
#SBATCH --mem=500G
#SBATCH --output=%j.out
module purge
module load java/1.8.0_60
module load R

R CMD BATCH /cluster/home/fdolan03/water_withdrawals_basin_unlimited.R
