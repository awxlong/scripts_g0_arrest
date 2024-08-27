#$ -l tmem=6G
#$ -l h_rt=36:00:00 
#$ -S /bin/bash
#$ -j y
#$ -l gpu=true
#$ -N mil_attentionMIL_resnet50_32epochs_cv5
echo "Running on host: $(hostname)"
echo "Starting at: $(date)"
cd secrier_lab/persistence/
source /home/xuelonan/secrier_lab/python3.8.5-biomedai.source
source /share/apps/source_files/cuda/cuda-11.8.source
python3 HistoMIL/Notebooks/mil_run.py --exp-name 'attentionMIL_resnet50_32epoch_rerun' \
                                      --project-name 'g0-arrest-resnet50-attentionMIL_cv5' \
                                      --wandb-entity-name 'cell-x' --localcohort-name 'COAD' --task-name 'g0_arrest' --pid-name 'PatientID' \
                                      --targets-name 'g0_arrest' \
                                      --cohort-dir '/home/xuelonan/secrier_lab/persistence/' \
                                      --split-ratio 0.9 0.1 --step-size 224 \
                                      --precomputed 'resnet50' \
                                      --label-dict "{0:0,1:1}" \
                                      --mil-algorithm "AttentionMIL" \
                                      --n-epochs 32 \
                                      --monitor-metric 'auroc_val' \
                                      --train \
                                      --k-fold 5
echo "Finished at: $(date)"