# Probabilistic Language-Image Pre-Training (ProLIP) ICLR 2025

[![arXiv](https://img.shields.io/badge/ProLIP_arXiv-2410.18857-b31b1b.svg)](https://arxiv.org/abs/2410.18857)
[![arXiv_2](https://img.shields.io/badge/LongProLIP_arXiv-2503.08048-b31b1b.svg)](https://arxiv.org/abs/2503.08048)
[![model_hub](https://img.shields.io/badge/HuggingFace-Hub-blue.svg)](https://huggingface.co/collections/SanghyukChun/prolip-6712595dfc87fd8597350291)

Official Python implementation of ProLIP | [Paper](https://arxiv.org/abs/2410.18857) | [LongProLIP Paper](https://arxiv.org/abs/2503.08048) | [Huggingface models](https://huggingface.co/collections/SanghyukChun/prolip-6712595dfc87fd8597350291)

[Sanghyuk Chun](https://sanghyukchun.github.io/home/), [Wonjae Kim](https://wonjae.kim/), [Song Park](https://8uos.github.io/), [Sangdoo Yun](https://sangdooyun.github.io/)

This codebase is built upon the following repositories

- https://github.com/naver-ai/pcmepp
- https://github.com/mlfoundations/open_clip/tree/v2.24.0

## Updates

- 12th Mar, 2025: Training code and LongProLIP weights are released!
- 25th Oct, 2024: Code is released! The full training code will be released soon.

## Quick start

- See [example.ipynb](src/example.ipynb) for how to use pre-trained weight

```python
from prolip.model import ProLIPHF
from transformers import CLIPProcessor
from prolip.tokenizer import HFTokenizer

processor = CLIPProcessor.from_pretrained("openai/clip-vit-base-patch16")
model = ProLIPHF.from_pretrained("SanghyukChun/ProLIP-ViT-B-16-DC-1B-12_8B")
tokenizer = HFTokenizer("timm/ViT-B-16-SigLIP", context_length=64, clean="canonicalize")

# image: PIL.Image / texts: list of strings
inputs = processor(images=image, return_tensors="pt", padding=True)
texts = tokenizer(texts)
outputs = model(image=inputs["pixel_values"], text=texts)
```

## How to cite

```
@inproceedings{chun2025prolip,
    title={Probabilistic Language-Image Pre-Training},
    author={Chun, Sanghyuk and Kim, Wonjae and Park, Song and Yun, Sangdoo},
    year={2025},
    booktitle={International Conference on Learning Representations (ICLR)},
}

@article{chun2025longprolip,
  title={LongProLIP: A Probabilistic Vision-Language Model with Long Context Text},
  author={Chun, Sanghyuk and Yun, Sangdoo},
  journal={arXiv preprint arXiv:2503.08048},
  year={2025}
}
```

I would like to suggest citing [PCME](https://github.com/naver-ai/pcme), [ECCV Caption](https://github.com/naver-ai/eccv-caption) and [PCME++](https://github.com/naver-ai/pcmepp), too.
```
@inproceedings{chun2021pcme,
    title={Probabilistic Embeddings for Cross-Modal Retrieval},
    author={Chun, Sanghyuk and Oh, Seong Joon and De Rezende, Rafael Sampaio and Kalantidis, Yannis and Larlus, Diane},
    year={2021},
    booktitle={Conference on Computer Vision and Pattern Recognition (CVPR)},
}

@inproceedings{chun2022eccv_caption,
    title={ECCV Caption: Correcting False Negatives by Collecting Machine-and-Human-verified Image-Caption Associations for MS-COCO}, 
    author={Chun, Sanghyuk and Kim, Wonjae and Park, Song and Chang, Minsuk Chang and Oh, Seong Joon},
    year={2022},
    booktitle={European Conference on Computer Vision (ECCV)},
}

@inproceedings{chun2024pcmepp,
    title={Improved Probabilistic Image-Text Representations},
    author={Chun, Sanghyuk},
    year={2024},
    booktitle={International Conference on Learning Representations (ICLR)},
}
```

## License

```
ProLIP
Copyright (c) 2024-present NAVER Cloud Corp.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
