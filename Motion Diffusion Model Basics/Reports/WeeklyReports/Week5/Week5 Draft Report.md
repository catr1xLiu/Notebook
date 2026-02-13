
> [!abstract] Introduction
> ## Weekly Summary: VPoser Pipeline & Extended Abstract

Summary of work completed, including VPoser fitting pipeline implementation, HumanML3D conversion adaptation, and extended abstract draft for 3DV Exploratory Edge submission.

---

> [!example] Work Completed
> ## 1.1 VPoser Fitting Pipeline and Batch Processing

The [**VPoser inverse kinematics engine**](https://github.com/catr1xLiu/human_body_prior/blob/a9ecd534e63f78c1e4109d8be915d205fc5508cc/src/fit_markers.py) from the `human-body-prior` project has been successfully adapted for our pipeline. Some technical challenges overcome:

1. _No pre-built package of `PyTorch3D` library for linux64 system_ → **Compiling library directly from source.**
2. _Outdated CUDA compatibility_ → **Updating all dependencies to python3.10+ standard and installing latest PyTorch.**
3. _Ugly batch processing strategy and log_ → **Modified script and batch processing automation.**
    
![[batch processing.png]]

Results from the new VPoser-based pipeline have been very satisfying, successfully resolving the "inflated body shape" and "twisted skeleton" issues of the previous data processing code.

> [!example] Work Completed
> ## 1.2 HumanML3D Pipeline Adaptation

The SMPL-to-HumanML3D conversion code from the original HumanML3D project has also been successfully adapted to the pipeline. Due to limited time, it is still awaiting results from the VPoser pipeline. Some technical challenges overcome:

1. Outdated environment → **Docker Image with CUDA Containerization**
2. Processing will take few hours → **Custom Batch Processing Script** (to be deployed on beatrix)

---

> [!info] Info
> ## 1.3 Extended Abstract Draft

[3DV Exploratory Edge Extended Abstract.pdf](attachment:555e3ae2-51a3-461a-88da-c6488d95be63:main.pdf)

### Abstract

> _Age affects walking patterns through kinematic signatures such as reduced velocity and shift in posture, but capturing these subtle differences in individual walking styles can be challenging. Impressive progress has been made in the field to detect and generate human motion of different styles. However, whether biomechanical signatures like aging can be learned by such models remains unexplored._
> 
> _We present a proof-of-concept that attempts to learn and reproduce the aging signature in human motion using graph and diffusion networks. A graph convolutional network is trained to predict subject age from captured motion, while a diffusion network is trained to generate new motion conditioned on age. Consistent age classification demonstrates that age-specific signals exist within clinical data, while results of the diffusion network show that this signal can be effectively reproduced. This study bridges clinical gait analysis with modern machine-learning models and lays the groundwork for age-aware motion synthesis systems._

### Motivation

> Aging affects gait motion through well-documented biomechanical changes: reduced velocity, shorter stride length, compensatory hip strategies, and increased double-support time [1,7]. These kinematic signatures carry clinical significance and can predict mortality in older adults [7].
> 
> Meanwhile, Spatial-Temporal Graph Convolutional Networks (ST-GCN) [10] have shown great consistency in skeleton-based action recognition, and text-to-motion generative models such as MDM [8] have been successful in generating realistic motion from language descriptions. However, current generative models are biased towards healthy young adults, and whether motion recognition and generation networks can grasp subtle changes caused by biomechanical factors remains unexplored.
> 
> We ask: _Can age-specific kinematic signatures be extracted from clinical datasets, recognized by a classification model, and reproduced by a generative model?_

### Approach

> **Data Pipeline.** The dataset used in this study [9] provides full-body motion capture of healthy adults and stroke survivors spanning the entire adult lifespan. But the clinical marker set and data format are incompatible with the standard representation [2] for model training. We develop a pipeline to convert clinical recordings to machine-learnable graph format through feature extraction and model fitting [4,5], with noise removal and temporal smoothing to preserve motion quality.
> 
> **Age Classification.** To verify that age-discriminative kinematic features survive the format conversion, we train a Spatial-Temporal Graph Convolutional Network (ST-GCN) [10] to classify motion clips into three age groups (Young, Mid, Elderly). Consistent classification accuracy proves that the aging signal is present and extractable.
> 
> **Age-Conditioned Generation.** We train separate Low-Rank Adapters [3,6] on each age group's motion data, inserted into the attention layers of a pretrained MDM [8]. The classifier network is reused in a training-validation loop to verify that age characteristics are reproduced.

### References
```
[1] Katherine A Boyer, Kate L Hayes, Brian R Umberger, et al.
Age-related changes in gait biomechanics and their impact
on the metabolic cost of walking: Report from a national institute on aging workshop. Experimental Gerontology, 173:
112102, 2023. 1

[2] Chuan Guo, Shihao Zou, Xinxin Zuo, Sen Wang, Wei Ji,
Xingyu Li, and Li Cheng. Generating diverse and natural
3d human motions from text. In CVPR, pages 5152–5161,
2022. 1

[3] Edward J Hu, Yelong Shen, Phillip Wallis, Zeyuan Allen-
Zhu, Yuanzhi Li, Shean Wang, Lu Wang, and Weizhu Chen.
LoRA: Low-rank adaptation of large language models. In
ICLR, 2022. 1

[4] Matthew Loper, Naureen Mahmood, Javier Romero, Gerard
Pons-Moll, and Michael J Black. SMPL: A skinned multi-
person linear model. ACM TOG, 34(6):248:1–248:16, 2015.
1

[5] Naureen Mahmood, Nima Ghorbani, Nikolaus F Troje, Gerard
Pons-Moll, and Michael J Black. AMASS: Archive of
motion capture as surface shapes. In ICCV, 2019. 1

[6] Haim Sawdayee, Chuan Guo, Guy Tevet, Bing Zhou, Jian
Wang, and Amit H Bermano. Dance like a chicken: Low-
rank stylization for human motion diffusion. arXiv preprint
arXiv:2503.19557, 2025. 1

[7] Stephanie Studenski, Subashan Perera, Kushang Patel, et al.
Gait speed and survival in older adults. JAMA, 305(1):50–58,
2023. 1

[8] Guy Tevet, Sigal Raab, Brian Gordon, Yonatan Shafir, and
Amit H Bermano. Human motion diffusion model. In ICLR,
2024. 1

[9] Tamaya Van Criekinge, Wim Saeys, Steven Truijen, Luc
Vereeck, Lizeth H Sloot, and Ann Hallemans. A full-body
motion capture gait dataset of 138 able-bodied adults across
the life span and 50 stroke survivors. Scientific Data, 10(1):
852, 2023. 1

[10] Sijie Yan, Yuanjun Xiong, and Dahua Lin. Spatial temporal graph convolutional networks for skeleton-based action
recognition. In AAAI, 2018. 1
```

---

> [!warning] Challenges Encountered
> ## 2.1 Bending Knee Problem

