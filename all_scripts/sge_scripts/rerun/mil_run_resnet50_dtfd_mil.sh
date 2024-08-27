#$ -l tmem=12G
#$ -l h_rt=90:00:00 
#$ -S /bin/bash
#$ -j y
#$ -l gpu=true,gpu_type=(p100|v100)
#$ -N mil_dtfd_resnet50_42epochs_cv5_multisteplr_resume
echo "Running on host: $(hostname)"
echo "Starting at: $(date)"
cd secrier_lab/persistence/
source /home/xuelonan/secrier_lab/python3.8.5-biomedai.source
source /share/apps/source_files/cuda/cuda-11.8.source
python3 HistoMIL/Notebooks/mil_run.py --exp-name 'mil_dtfd_resnet50_42epochs_cv5_multisteplr' \
                                      --project-name 'g0-arrest-resnet50-dtfdmil-cv5-multisteplr-rerun' \
                                      --wandb-entity-name 'anwangxuelong' --localcohort-name 'COAD' --task-name 'g0_arrest' --pid-name 'PatientID' \
                                      --targets-name 'g0_arrest' \
                                      --cohort-dir '/home/xuelonan/secrier_lab/persistence/' \
                                      --split-ratio 0.9 0.1 --step-size 224 \
                                      --precomputed 'resnet50' \
                                      --label-dict "{0:0,1:1}" \
                                      --mil-algorithm "DTFD_MIL" \
                                      --n-epochs 42 \
                                      --monitor-metric 'auroc_val' \
                                      --k-fold 5 \
                                      --last-cv 0 \
                                      --ckpt-filename mil_dtfd_resnet50_42epochs_cv5_multisteplrcv=0_epoch=07-auroc_val=0.69
echo "Finished at: $(date)"