# create the fmriprep and MRIqc singularity images on TACC allocation
# puts the images in a folder in $WORK called bids-apps

module load tacc-singularity
module load python3

DEST=${WORK}/bids-apps
mkdir -p ${DEST}

FMRIPREP_VERS=1.4.0
MRIQC_VERS=0.15.0
#for all intents and purposes this should work but something is wrong with my python version and doesn't run for me, try it anyways...

SINGULARITY_NOHTTPS=yes singularity build \
    ${DEST}/fmriprep.${FMRIPREP_VERS}.simg \
    docker://poldracklab/fmriprep:${FMRIPREP_VERS}

singularity build \
    ${DEST}/mriqc.${MRIQC_VERS}.simg \
    docker://poldracklab/mriqc:${MRIQC_VERS}

