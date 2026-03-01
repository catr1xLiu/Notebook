# Week5 Report (Draft)

# 1. Work Completed

<aside>
🔨

## 1.1 VPoser Fitting Pipeline and Batch Proccessing

</aside>

The [**VPoser inverse kinematics engine**](https://github.com/catr1xLiu/human_body_prior/blob/a9ecd534e63f78c1e4109d8be915d205fc5508cc/src/fit_markers.py) [](https://github.com/catr1xLiu/LoRA-MDM-Age-Dataset)from the `human-body-prior` project has been successfuly adapted for our pipeline. Some technical challenges overcame:

1. *No pre-built package of `PyTorch3D` library for linux64 system* → **Compiling library directly from source.**
2. *Outdated cuda compatibility* → **Updating all dependencies to python3.10+ standard and installing latest pytorch.**
3. *Ugly batch proccessing strategy and log* → **Modified script and batch proccessing automation.**
    
    ![Screenshot_2026-02-10_20-18-53.png](Week5%20Report%20(Draft)/Screenshot_2026-02-10_20-18-53.png)
    

Results from the new VPoser-based pipeline have been very satisfying, successfully resolving the “inflated body shape” and “twisted skeleton” issues of the previous data proccessing code.

![smpl_mesh_5.png](Week5%20Report%20(Draft)/smpl_mesh_5.png)

$$
\longrightarrow
$$

![Figure_2.png](Week5%20Report%20(Draft)/0d6ad266-8b82-4c11-9663-b58a26f298f5.png)

<aside>
💃🏻

## 1.2 HumanML3D pipeline adaption

</aside>

The SMPL-to-HumanML3D conversion code from the original HumanML3D project has also been successfully adapted to the pipeline. Due to limited time, it is still awating for results from the VPoser pipeline. Some technical challenges overcame:

1. Outdated environment → **Docker Image with Cuda Containerization**
2. Proccessing will take few hours → **Custom Batch Proccessing Script** (to be deployed on beatrix)

<aside>
📃

## 1.3 Extended Abstract Draft

</aside>

[3DV Exploratory Edge Extended Abstract.pdf](Week5%20Report%20(Draft)/main.pdf)

### Abstract

> *Age affects walking patterns through kinematic signatures such as reduced velocity and shift in posture, but capturing these subtle differences in individual walking styles can be challenging. Impressive progress has been made in the field to detect and generate human motion of different styles. However, whether biomechanical signatures like aging can be learned by such models remains unexplored.*
> 
> 
> *We present a proof-of-concept that attempts to learn and reproduce the aging signature in human motion using graph and diffusion networks. A graph convolutional network is trained to predict subject age from captured motion, while a diffusion network is trained to generate new motion conditioned on age. Consistent age classification demonstrates that age-specific signals exist within clinical data, while results of the diffusion network show that this signal can be effectively reproduced. This study bridges clinical gait analysis with modern machine-learning Models and lays the groundwork for age-aware motion synthesis systems.*
> 

### Moltivation

> Aging affects gait motion through well-documented biomechanical changes: reduced velocity, shorter stride length, compensatory hip strategies, and increased double-support time [1,7]. These kinematic signatures carry clinical significance and can predict mortality in older adults [7].
> 
> 
> Meanwhile, Spatial-Temporal Graph Convolutional Networks (ST-GCN) [10] have shown great consistency in skeleton-based action recognition, and text-to-motion generative models such as MDM [8] have been successful in generating realistic motion from language descriptions. However, current generative models are biased towards healthy young adults, and whether motion recognition and generation networks can grasp subtle changes caused by biomechanical factors remains unexplored.
> 
> We ask: *Can age-specific kinematic signatures be extracted from clinical datasets, recognized by a classification model, and reproduced by a generative model?*
> 

### Approach

> **Data Pipeline.**
The dataset used in this study [9] provide full-body motion capture of healthy adults and stroke survivors spanning the entire adult lifespan. But the clinical marker set and data format are incompatible with the standard representation [2] for models training. We develop a pipeline to convert clinical recordings to machine-learnable graphs format through feature extraction and model fitting [4,5], with noise removal and temporal smoothing to preserve motion quality.
> 
> 
> **Age Classification.**
> To verify that age-discriminative kinematic features survive the format conversion, we train a Spatial-Temporal Graph Convolutional Network (ST-GCN) [10] to classify motion clips into three age groups (Young, Mid, Elderly). Consistent classification accuracy proves that the aging signal is present and extractable.
> 
> **Age-Conditioned Generation.**
> We train separate Low-Rank Adapters [3,6] on each age group's motion data, inserted into the attention layers of a pretrained MDM [8]. The classifier network is reused in a training-validation loop to verify that age characteristics are reproduced.
> 

### Show References

```
[1] Katherine A Boyer, Kate L Hayes, Brian R Umberger, et al.
Age-related changes in gait biomechanics and their impact
on the metabolic cost of walking: Report from a national institute on aging workshop. Experimental Gerontology, 173:
112102, 2023. 1
[2] Chuan Guo, Shihao Zou, Xinxin Zuo, Sen Wang, Wei Ji,
Xingyu Li, and Li Cheng. Generating diverse and natural
3d human motions from text. In CVPR, pages 5152–5161,
2022. 1
[3] Edward J Hu, Yelong Shen, Phillip Wallis, Zeyuan AllenZhu, Yuanzhi Li, Shean Wang, Lu Wang, and Weizhu Chen.
LoRA: Low-rank adaptation of large language models. In
ICLR, 2022. 1
[4] Matthew Loper, Naureen Mahmood, Javier Romero, Gerard
Pons-Moll, and Michael J Black. SMPL: A skinned multiperson linear model. ACM TOG, 34(6):248:1–248:16, 2015.
1
[5] Naureen Mahmood, Nima Ghorbani, Nikolaus F Troje, Gerard Pons-Moll, and Michael J Black. AMASS: Archive of
motion capture as surface shapes. In ICCV, 2019. 1
[6] Haim Sawdayee, Chuan Guo, Guy Tevet, Bing Zhou, Jian
Wang, and Amit H Bermano. Dance like a chicken: Lowrank stylization for human motion diffusion. arXiv preprint
arXiv:2503.19557, 2025. 1
[7] Stephanie Studenski, Subashan Perera, Kushang Patel, et al.
Gait speed and survival in older adults. JAMA, 305(1):50–58,
2011. 1
[8] Guy Tevet, Sigal Raab, Brian Gordon, Yonatan Shafir, and
Amit H Bermano. Human motion diffusion model. In ICLR,
2023. 1
[9] Tamaya Van Criekinge, Wim Saeys, Steven Truijen, Luc
Vereeck, Lizeth H Sloot, and Ann Hallemans. A full-body
motion capture gait dataset of 138 able-bodied adults across
the life span and 50 stroke survivors. Scientific Data, 10(1):
852, 2023. 1
[10] Sijie Yan, Yuanjun Xiong, and Dahua Lin. Spatial temporal graph convolutional networks for skeleton-based action
recognition. In AAAI, 2018. 1
```

# 2. Challenges Encountered

<aside>
📃

## 2.1 Bending Knee Problem

</aside>

![Subj01.png](Week5%20Report%20(Draft)/da1311fd-5b44-4a29-8264-0d6b49db9b9c.png)

![Subj130.png](Week5%20Report%20(Draft)/fd0a3464-bd55-4015-bf95-d98c4733e752.png)

![Subj06.png](Week5%20Report%20(Draft)/f95414f6-6cfb-4830-91ba-3902b1a7dbe6.png)

![Subj132.png](Week5%20Report%20(Draft)/1ec4b020-c19f-4302-b63f-04309010640d.png)

![Figure_4.png](Week5%20Report%20(Draft)/0114560a-65ba-4754-bcc0-738f85b8b525.png)