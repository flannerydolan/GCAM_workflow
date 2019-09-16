#!/bin/bash
#SBATCH --time=7:00:00
#SBATCH -p llab
#SBATCH -n 1
#SBATCH --mem=30000


#SBATCH --output=%A.%a.out
#SBATCH --error=%A.%a.err
#SBATCH --array=1-60


module purge
module load java/1.7.0_51
module load R
module load git
export BOOSTROOT=${HOME}/src/boost_1_62_0
export BOOST_INCLUDE=${HOME}/include
export BOOST_INCLUDE=/cluster/home/fdolan03/src/boost_1_62_0/
export BOOST_LIB=/cluster/home/fdolan03/src/boost_1_62_0/libs
export BOOST_LIB=${HOME}/lib
export XERCES_INCLUDE=${HOME}/include
export XERCES_INCLUDE=/cluster/home/fdolan03/libs/xercesc/include
export XERCES_LIB=/cluster/home/fdolan03/libs/xercesc/lib
export XERCES_LIB=${HOME}/lib export JARS_LIB=/cluster/tufts/lamontagnelab/fdolan03/GCAM/libs/jars/*
export JAVA_INCLUDE=${JAVA_HOME}/include export JAVA_LIB=${JAVA_HOME}/jre/lib/amd64/server
export CXX=g++ job=$SLURM_JOB_NAME


FILES=(/cluster/tufts/lamontagnelab/fdolan03/GCAM/config_files/ssp_soc/ssp_socio5/ag5/*)    
FILE=${FILES[$SLURM_ARRAY_TASK_ID-1]}

date 
time
./gcam.exe -C$FILE -Llog_conf.xml
date
