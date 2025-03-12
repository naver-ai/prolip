"""
Original code: https://github.com/mlfoundations/open_clip/blob/v2.24.0/src/training/precision.py
"""
import torch
from contextlib import suppress


def get_autocast(precision):
    if precision == 'amp':
        return torch.amp.autocast
    elif precision == 'amp_bfloat16' or precision == 'amp_bf16':
        # amp_bfloat16 is more stable than amp float16 for clip training
        return lambda: torch.amp.autocast(dtype=torch.bfloat16, device_type='cuda')
    else:
        return suppress
