#!/bin/bash
set -ex
DATA_DIR="/home/lq/Research/Reading-Comprehension/les-military-mrc/input/answer_mrc_dataset_test"
MODEL_DIR="/home/lq/Research/Reading-Comprehension/pretrained_weights/chinese_wwm_pytorch"
RELOAD_MODEL_DIR="models/bert_wwm_BertForLes_test"

python run_les.py \
    --cuda_devices 2,3 \
    --model_type bert \
    --customer_model_class BertForLes \
    --model_name_or_path ${RELOAD_MODEL_DIR}/pytorch_model.bin \
    --config_name ${MODEL_DIR}/bert_config.json \
    --tokenizer_name ${MODEL_DIR}/vocab.txt \
    --do_eval \
    --do_lower_case \
    --predict_file ${DATA_DIR}/dev_combine_pred_bridge_entity.json \
    --output_dir ${RELOAD_MODEL_DIR} \
    --version_2_with_negative \
    --max_seq_length 512 \
    --max_query_length 64 \
    --max_answer_length 110 \
    --per_gpu_eval_batch_size 48 \
    --doc_stride 128 \
    --logging_steps 0 \
