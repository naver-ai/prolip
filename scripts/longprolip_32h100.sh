torchrun --nproc_per_node=8 \
    --nnodes=4 \
    --node_rank=$RANK \
    --master_addr=$MASTER_ADDR \
    --master_port=$MASTER_PORT \
    -m prolip_train.main \
    --train-data $PATH_TO_DATASET \
    --train-num-samples 8000000 \
    --aug-cfg scale='(0.8, 1.0)' color_jitter='(0.32, 0.32, 0.32, 0.08)' color_jitter_prob=0.8 gray_scale_prob=0.2 \
    --beta1 0.9 \
    --beta2 0.95 \
    --lr "1e-6" \
    --epochs 32 \
    --batch-size 256 \
    --warmup 200 \
    --wd 0.01 \
    --zeroshot-frequency 1 \
    --dataset-resampled \
    --dataset-type webdataset \
    --model ViT-B-16-ProLIP-long \
    --precision amp_bf16 \
    --workers 8 \
    --imagenet-val $IMAGENET_PATH \
    --coco-test $COCO_PATH \
    --prolip-logs $LOG_PATH \
    --accum-freq 1 \
    --vib-beta 0.0001 \
    --inclusion-alpha 0.0000001 \
    --inclusion-alpha-occ 0.001 \
    --inclusion-scale 10 \
    --inclusion-eps -100 \
    --drop-ratio 0.125 \
    --drop-prob 0.75 \
    --delete-previous-checkpoint \
    --prolip \
    --force-resize-pos-emb \
    --pretrained $PATH_TO_PRETRAINED \
    --torchcompile
