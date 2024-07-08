set -x
mkdir -p /local/apps/nemo/.cache
mkdir -p /data/checkpoints/${JEEVES_JOB_ID}
export HF_HOME=/local/apps/nemo/.cache
which python
if [ $RANK == 0 ]
then
python scripts/checkpoint_converters/convert_qwen2_hf_to_nemo.py \
    --input_name_or_path /mnt/data/user/tc_agi/wcy123/models/qwen2_7b_sft0704_iter6400 \
    --output_path /data/checkpoints/${JEEVES_JOB_ID} \
    --precision bf16
fi