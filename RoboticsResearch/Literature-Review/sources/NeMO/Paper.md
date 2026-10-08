# Finding NeMO: A Geometry-Aware Representation of Template Views for Few-Shot Perception

Sebastian Jung, Leonard Klüpfel, Rudolph Triebel, Maximilian Durner — German Aerospace Center (DLR) — 3DV 2026

> Converted from the arXiv LaTeX source ([2602.04343](https://arxiv.org/abs/2602.04343)) with pandoc; acronyms and custom macros expanded, figures rasterized to PNG. Citations are kept as `[@bibkey]`; cross-references as `[label]`.

![](media/cover_figure.png)

*Figure — **Overview.** Our method uses a multi-view encoder to generate an object-centric geometric encoding called Neural Memory Object (NeMO) with its own coordinate system from a set of RGB images depicting an object unseen during training. A decoder uses the NeMO to retrieve dense predictions allowing us to detect, segment, estimate the objects surface and determine the camera-to-object position on an RGB query image. Even in cluttered scenes, our method is able to find the object, which we can use to crop the corresponding region of interest, demonstrating that our method can be used for multi-stage perception pipelines. Images were captured using a normal smartphone.*

# Abstract

We present Neural Memory Object (NeMO), a novel object-centric representation that can be used to detect, segment and estimate the 6DoF pose of objects unseen during training using RGB images. Our method consists of an encoder that requires only a few RGB template views depicting an object to generate a sparse object-like point cloud using a learned UDF containing semantic and geometric information. Next, a decoder takes the object encoding together with a query image to generate a variety of dense predictions. Through extensive experiments, we show that our method can be used for few-shot object perception without requiring any camera-specific parameters or retraining on target data. Our proposed concept of outsourcing object information in a NeMO and using a single network for multiple perception tasks enhances interaction with novel objects, improving scalability and efficiency by enabling quick object onboarding without retraining or extensive pre-processing. We report competitive and state-of-the-art results on various datasets and perception tasks of the BOP benchmark, demonstrating the versatility of our approach. <https://github.com/DLR-RM/nemo>

# Introduction

Objects play a central role in our daily lives, and recognizing them in images is critical for applications such as robotics, augmented reality, and autonomous systems. Recent advances in deep learning and computer vision have greatly improved object perception, especially in *model-based* approaches that leverage 3D CAD models to train deep networks for detection, segmentation, and pose estimation [@hodan_bop_2024]. These methods benefit from large-scale synthetic training [@Denninger2023] and can specialize in specific objects or categories, achieving impressive performance when 3D models are available at test time. However, in many real-world scenarios, it is impractical to assume access to a 3D model for every object. As a result, *model-free perception* has become a growing research focus, aiming to rapidly onboard and recognize novel objects.

When a CAD model is unavailable during training but provided at inference, recent methods adapt perception models using rendered templates of the target object, leveraging the geometric and textural cues from these synthetic views. Some approaches fine-tune object-specific networks in minimal time [@bop_frtpose], while others use general-purpose features to recognize new objects without retraining [@nguyen_cnos_2023]. A common strategy compares features between template views and query images, followed by post-processing [@nguyen_gigapose_2024; @labbe_megapose_2023]. However, these approaches scale poorly with the number of templates and rely on pairwise local comparisons [@sarlin_superglue_2020; @sun_loftr_2021; @detone_superpoint_2018], without jointly reasoning over all views. While still affected by the sim-to-real gap, such methods enable fast onboarding of CAD models.

In model-free object perception -- where no CAD model is available at any stage -- the challenge is greater. Synthetic training tailored to the object is infeasible, and geometric information must be extracted from real reference images, where object-to-camera poses are typically unknown. Some methods rely on template or local feature matching using real images [@lin_relpose_2024; @he_fs6d_2022], while others employ neural fields [@mildenhall2020nerfrepresentingscenesneural] to reconstruct CAD-like geometry [@wen_bundlesdf_2023; @wen_foundationpose_2024], requiring extrinsic pose information.

To overcome the limitations of existing perception systems in terms of generalization, scalability, and efficiency, we propose a novel encoder-decoder architecture trained on a large-scale synthetic dataset. Our method constructs a geometry-aware representation, termed NeMO, from a set of unordered, object-centric RGB images, without requiring camera calibration or pose annotations. NeMO is formulated as a sparse, continuous point cloud that encapsulates both semantic and geometric features observed from multiple viewpoints. Unlike conventional encoder-decoder models that compress inputs into a single latent vector [@Sundermeyer_2018_ECCV; @Shi24arxiv-crisp], NeMO preserves a structured, interpretable abstraction of object geometry, enabling transformations such as translation, rotation, and scaling without reliance on a 3D CAD model. Critically, the object-specific information is disentangled from the decoder's parameters, enabling object-agnostic inference and robust generalization to novel instances not seen during training. The point-based representation supports incremental refinement through the addition of new views, without necessitating reprocessing of previous observations. Furthermore, the decoupling of encoding and decoding facilitates efficient deployment, as NeMO can be precomputed offline, rendering inference time invariant to the number of input views and improving scalability for real-world applications.

We extensively ablate the representation to analyze its potential and quantitatively demonstrate its performance on multiple object perception tasks, achieving competitive and state-of-the-art results on model-free and model-based unseen object benchmarks. Additionally, we qualitatively show its potential for object surface reconstruction. Concretely, our contributions are threefold:

- We propose the **NeMO**, a geometry-sensitive, and compact representation of template views well-suited for few-shot object perception tasks.

- We evaluate our encoder-decoder network on the task of model-based and -free **few-shot detection, segmentation and pose estimation of unseen objects**. Without training on test objects, we perform competitively and partially better against state-of-the-art methods.

- We contribute an object-centric **diverse synthetic dataset**, mimicking realistic cluttered scenes that balances the occurrences of different object classes to advance research on related topics.

![](media/nemo_overview.png)

*Figure — **Overview of the NeMO approach.** RGB template views are first processed by a ViT [@dosovitskiy2020image] and a multi-view encoder [@jiang_leap_2023], producing updated image features. To incorporate spatial information, a randomly-sampled point cloud is processed through a MLP and attended to the image features in our proposed *Geometric Mapping* block, yielding feature-enhanced 3D points that form the NeMO. A decoder attends a query image with the NeMO using multiple Cross- and Self-Attention blocks to generate multiple dense predictions. We represent the NeMO as a point cloud and reduce the higher dimensional NeMO features to RGB using PCA [@sarker2021ml]. The PCA reduction shows a relation between the learned features and the objects geometry and semantics.*

# Related Work

Our work focuses on the perception of previously *unseen* objects, encompassing detection, segmentation, and pose estimation. *Unseen* refers to objects not explicitly seen during training, provided at runtime via 3D models (*model-based*) or a set of RGB template images (*model-free*). While designed for the model-free setting, our method also supports model-based input.\
**Unseen Object Segmentation and Detection.** Given a target object, GFreeDet [@liu2025gfreedet], a model-free method, detects and segments objects through reconstructing a Gaussian object and comparing generated templates to region proposal from the query image. NOCTIS [@gandyra2025noctisnovelobjectcyclic] similarly computes segmentation masks by matching the appearance and semantic of reference images and a query image as obtained through Grounded SAM2 and DINOv2.\
Instead of learning a presentation to render template images, model-based approaches directly use the provided CAD-model. To this end, CNOS [@nguyen_cnos_2023] matches DINOv2 [@oquab2023dinov2] tokens of template renderings with region proposals derived from SAM/ FastSAM [@zhao2023fast; @Kirillov_2023_ICCV]. Similarly, NIDS-Net [@lu2024adapting] also leverages SAM [@Kirillov_2023_ICCV] and Grounding DINO [@liu2024grounding] to obtain proposal embeddings which are compared to averaged and masked DINOv2's template embeddings of the object. OC-DiT [@ulmer2025conditionallatentdiffusionmodels] uses latent diffusion models conditioned on template images to generate segmentation masks.\
**Unseen Object Pose Estimation.** Model-free pose estimation also commonly requires multiple reference registration images [@sun_onepose_2022; @park_latentfusion_2020; @wen_foundationpose_2024; @leonardis_grounding_2025]. To this end, FS6D [@he_fs6d_2022] predicts 6D poses by fusing features from support RGBD images and the query scene to establish dense correspondences. OnePose [@sun_onepose_2022] and OnePose++ [@he_oneposeplusplus_2022] employ pairwise image matching of dense 2D-3D correspondences hierarchically in a coarse-to-fine fashion. RelPose [@avidan_relpose_2022] estimates the relative camera rotation between image pairs through an energy-based formulation, which is extended to the relative 6D pose based on multiple images in the extension RelPose++ [@lin_relpose_2024]. In contrast, PIZZA [@nguyen_pizza_2022] approaches 6D object tracking through either an image pair or multiple template images between which the relative pose is estimated. Similarly, BundleSDF [@wen_bundlesdf_2023] jointly tracks poses and learns a Neural Object Field from a RGB-D stream, using RGB renderings from the learned field to supervise texture and geometry prediction. FoundationPose [@wen_foundationpose_2024] estimates either single-view poses for a model-based or a model-free scenario and also performs pose tracking. The model-free setup is similar to BundleSDF, whereas in the model-based scenario templates are rendered based on the given model.\
Analogously to detection and segmentation, model-based pose estimation relies on a CAD model of the unseen target object. GigaPose [@nguyen_gigapose_2024] relies on comparing and matching the most similar RGB template to the query image. MegaPose [@labbe_megapose_2023] applies a render-and-compare strategy to refine the best reference rendering of the target object. Both methods rely on pre-training on a large-scale synthetic dataset spanning 2 million images. OSOP [@shugurov_osop_2022] establishes dense 2D-3D correspondences based on a template match, similar to ZS6D [@ausserlechner_zs6d_2024], which also relies on a self-supervised pre-trained ViT for feature extraction. SAM6D [@Lin_2024_CVPR] predicts the 6D pose and the segmentation mask by applying a coarse-to-fine 3D-3D correspondence matching strategy that builds up on region proposal obtained from SAM and matched with template renderings w.r.t. appearance, semantics and geometry. Similarly, ZeroPose [@zeropose_2025] also estimates the 6D pose and the segmentation masks given the CAD model and an RGB-D image as input. The method matchs the query image with the feature embeddings derived from DINOv2 and prompted with the CAD model.

# Method

In the following, we present our encoder-decoder network as well as the proposed Neural Memory Object (NeMO) representation. \[fig:method\] gives an overview of the complete approach. Our core idea is to separate visual and geometric object information from neural network weights, enabling an object-agnostic approach that adapts to any demonstrated target object without additional training. To this end, given a set of RGB template images $\mathcal{I}= \left\{ I_{i} \right\}_{i=1}^{K}$ of an object, where $K \geq 2$ and $I_{i} \in \mathbb{R}^{H\times W\times 3}$ with $H$ and $W$ being the image height and width, we aim to construct a unified, object-centric representation without the need for intrinsic or extrinsic camera parameters.

## Network Architecture

**NeMO Encoder**. As Leap [@jiang_leap_2023] has shown strong generalizability to novel objects, we use a similar attention mechanism in our network. A ViT [@dosovitskiy2020image] is used to extract patch-wise image features from all template images $\mathcal{F}^{\mathcal{I}}= \left\{ f^{\mathcal{I}}_{i} \right\}_{i=1}^{N}$ with $f^{\mathcal{I}}_{i} \in \mathbb{R}^{d}$ and $N=H_{\text{patch}}\times W_{\text{patch}}\times K$ where $H_{\text{patch}}, W_{\text{patch}}$ are the number of vertically and horizontally extracted patches respectively. Since no prior information about the object coordinate frame or the camera-to-object transformation is provided, we define an anchor image $I_{\text{A}}$. It serves as the object's initial orientation in the NeMO space. During training, a random image from $\mathcal{I}$ acts as anchor $I_{\text{A}}$. As in [@jiang_leap_2023], we employ a multi-view encoder to generate updated image features $\widehat{\mathcal{F}}^{\mathcal{I}}$. This part incorporates a strong bias towards the anchor image, using cross- and self-attention blocks that facilitate interactions between the anchor and non-anchor features.

**Geometric Mapping.** To enhance these features with the 3D geometry of the object oriented in the anchor coordinate system, we first create $\mathcal{Q}= \left\{ q_{i} \right\}_{i=1}^{M}$, a set of sampled 3D points $q_{i} \in[-1, 1]^{3}$ with $M \geq 1$. Next, we train a MLP (see Supplementary \[fig:mlp_block\]) to act as point encoder $\lambda$ that maps each 3D point $q_{i}$ to a corresponding feature vector $\mathcal{F}^{\mathcal{Q}}= \left\{ f^{\mathcal{Q}}_{i} \right\}_{i=1}^{M} = \left\{ \lambda\left(q_{i}\right) \right\}_{i=1}^{M}$ with $f^{\mathcal{Q}}_{i} \in \mathbb{R}^{d}$. We fuse the resulting set of point features $\mathcal{F}^{\mathcal{Q}}$ and the updated image features $\widehat{\mathcal{F}}^{\mathcal{I}}$ via our proposed *geometric mapping block*. As shown in \[fig:nemo_geometric_mapping\], the initial point features $\mathcal{F}^{\mathcal{Q}}$ are updated with the information from $\widehat{\mathcal{F}}^{\mathcal{I}}$ through multiple Transformer Decoders:

$$
\begin{aligned}
        \widehat{\mathcal{F}}^{\mathcal{Q}} = \left\{ \widehat{f_{i}}^{\mathcal{Q}} \right\}_{i=1}^{M} = \text{TransformerDec}(\mathcal{F}^{\mathcal{Q}}, \widehat{\mathcal{F}}^{\mathcal{I}}) \in \mathbb{R}^{d},
    \end{aligned}
$$

where $\mathcal{F}^{\mathcal{Q}}$ acts as queries and $\widehat{\mathcal{F}}^{\mathcal{I}}$ as key-value pairs. This allows the initial 3D point cloud features to attend to object-specific 2D image features. Besides the visual cues, we also want to encode shape information of the object. Therefore, we jointly learn a UDF $\mathcal{U}$ using an MLP that predicts the unsigned distance from each point $q_{i}$ in the initial point cloud $\mathcal{Q}$ to its closest point $s_{i} \in[-1, 1]^{3}$ on the estimated object surface $\mathcal{S}= \left\{ s_{i} \right\}_{i=1}^{M}$ w.r.t. the coordinate system of $I_{\text{A}}$. Note that $|\mathcal{Q}| = |\mathcal{S}|$. Since $\widehat{f_{i}}^{\mathcal{Q}}$ depends on $q_{i}$ we can define the distance $d_{i}$ and direction $v_{i}$ as

$$
\begin{aligned}
        d_{i} & =  \mathcal{U}\left(\widehat{f_{i}}^{\mathcal{Q}}\left(q_{i}\right)\right) \in \mathbb{R} \quad\mathrm{and}\quad
        v_{i} & = \frac{d\mathcal{U}\left(\widehat{f_{i}}^{\mathcal{Q}}\left(q_{i}\right)\right)}{d q_{i}} \in \mathbb{R}^{\text{3}},
    \end{aligned}
$$

such that $s_{i} = q_{i} - d_{i} v_{i}$. Note that $d_{i}$ is a scalar.

**NeMO Representation.** Given the $M$ estimated surface points from the set $\mathcal{S}$ and the processed 3D point features $\widehat{\mathcal{F}}^{\mathcal{Q}}$, we define our NeMO representation as $\chi= \left\{ \left( s_{i}, \widehat{f_{i}}^{\mathcal{Q}} \right) \right\}_{i=1}^{M}$. Keeping $s_{i}$ and $\widehat{f_{i}}^{\mathcal{Q}}$ separate, we can transform the point cloud in NeMO space, allowing us to free $\chi$ from the anchor coordinate system defined by $I_{\text{A}}$. This gives the advantage of being able to modify the geometric prediction of downstream tasks. For convenience, we define the complete NeMO encoder (see \[fig:method\]) as a neural network $\Psi$ such that $\chi= \Psi(\mathcal{I}, \mathcal{Q})$. To fuse the information of the predicted 3D points $s_{i}$ and their corresponding features we set $\widetilde{f_{i}}^{\mathcal{Q}} = \widehat{f_{i}}^{\mathcal{Q}} + \lambda(s_{i})$. Our continuous UDF approach differs from Leap [@jiang_leap_2023], which relies on a discrete, fixed-size neural volume. We design our architecture to allow

variation in the number of points $M$, adjusting the size and descriptiveness of $\chi$,

biased point sampling for $\mathcal{Q}$, such as surface points from a CAD model,

transformations of the NeMO point cloud, allowing object modifications after the NeMO generation, and

extension of an existing NeMO with another set of NeMO points.

**NeMO Decoder.** When observing a query image $I_{\text{q}}\notin \mathcal{I}$ the goal of our decoder $\Theta$ is to use the information stored in a NeMO, which integrates information from all images in $\mathcal{I}$, to return a set of perception related dense predictions for the query image. As a first step the query image features $\mathcal{F}^{\text{q}}= \left\{f^{\text{q}}_{i} \right\}_{i=1}^{H_{\text{patch}\times W_{\text{patch}}}}$ obtained by a ViT are updated by the information stored in $\widetilde{f_{i}}^{\mathcal{Q}}$ using a combination of cross- and self-attention layers as shown in \[fig:method\]. Inspired by the recent advancements in camera pose estimation and dense predictions [@wang_dust3r_2024; @leonardis_grounding_2025; @wang2025vggt], we use DPT [@Ranftl_2021_ICCV] with multiple output heads to upscale the updated query image features $\widehat{\mathcal{F}^{\text{q}}}$ to multiple dense outputs $\Theta(\chi, I_{\text{q}}) = \left( P_{\text{modal}}, P_{\text{amodal}}, X, C \right)$, where $P_{\text{modal}} \in \mathbb{R}^{\text{H}\times\text{W}}$ and $P_{\text{amodal}} \in \mathbb{R}^{\text{H}\times\text{W}}$ are the predicted modal and amodal segmentation masks of the object, $X \in \mathbb{R}^{\text{H}\times\text{W}\times\text{3}}$ is the predicted dense pointmap between 2D pixels in $I_{\text{q}}$ and their corresponding 3D surface points in the coordinate system defined by $\chi$ and $C \in \mathbb{R}^{\text{H}\times\text{W}}$ is the associated learned confidence map to assess the 2D-3D mapping accuracy of $X$. After filtering the estimated pointmap based on $C$, we utilize RANSAC [@fischler_1981] and PnP [@Hartley_Zisserman_2004; @lepetit_2009] to estimate the pose of the object in the query image.

![](media/nemo_geometric_mapping.png)

*Figure — **Geometric Mapping Block.** We fuse the updated image features (key-value pairs) with the pre-processed geometric features (queries) in multiple transformer decoder blocks. The features are then forwarded to a UDF that estimates the unsigned distance of the initial point cloud to the estimated object surface. After further processing these points via a MLP, we combine them with the updated geometric features, resulting in the NeMO.*

## Training

We train the encoder $\Psi$ and decoder $\Theta$ jointly end-to-end through multiple losses. During training, we have access to a dataset of synthetically rendered RGB-D images with ground truth object poses, amodal and modal masks and camera intrinsic. Given a training sample of multiple images of the same object, we randomly select one image as the anchor image $I_{\text{A}}$ and one as a query image $I_{\text{q}}$ and use the ground truth poses together with the masked depth and camera intrinsic to build the ground truth surface points of the initial orientation of the NeMO space.

**Losses.** To enforce the encoder to predict towards ground truth surface points we define a simple regression loss that minimizes the Euclidean distance between the estimated surface point $s_{i} = q_{i} - \widetilde{\mathcal{U}}(q_{i}) \times \frac{d\widetilde{\mathcal{U}}(q_{i})}{dq_{i}}$ and the ground truth surface point $\bar{s}_{i}$:

$$
\text{L}_{\chi}= \frac{\sum_{i=1}^{M} \lVert s_{i}-\bar{s}_{i}\rVert}{M},
$$

with $M = |\chi|$. We do not directly enforce any loss on the NeMO features $\widehat{\mathcal{F}}^{\mathcal{Q}}$ so that they can be freely learned through backpropagation through the decoder. During training, after $\Psi$ has predicted $\chi$, we randomly rotate, translate and scale the NeMO points $s_{i}$ by a random transformation $\mathbf{T}$ to teach the decoder to learn a coordinate system that is independent of the anchor image $I_{\text{A}}$. We define additional losses on the dense predictions of the decoder $\Theta$. For the modal and amodal segmentation losses $\text{L}_{\text{modal}}$ and $\text{L}_{\text{amodal}}$ we use an equally weighted dice-loss [@milletari_2016_dice_loss] and binary cross-entropy loss [@jadon_2020]. The pointmap loss $\text{L}_{\text{2D3D}}$ is a confidence weighted L1 loss which uses the estimated confidence map $C$ to weight the loss between the estimated 2D-3D correspondences $X$ and the ground truth mapping $\bar{X}$. To learn the confidence map $C$, we define a certainty loss $\text{L}_{\text{certain}}$ and an uncertainty loss $\text{L}_{\text{uncertain}}$:

$$
\begin{aligned}
        \text{L}_{\text{certain}}   & = \frac{\sum\limits_{i \in \mathcal{D}_{\text{Obj}}} \Bigl( 1 - \tanh\bigl(\exp(C_{i})\bigr) \Bigr)}{\left| \mathcal{D}_{\text{Obj}} \right|} \\
        \quad \text{L}_{\text{uncertain}} & = \frac{\sum\limits_{i \in \mathcal{D}_{\text{Bg}}} \Bigl(\tanh\bigl(\exp(C_{i})\bigr)\Bigr)}{\left| \mathcal{D}_{\text{Bg}} \right|}
    \end{aligned}
$$

where $\mathcal{D}_{\text{Obj}}$ are the pixels belonging to the object and $\mathcal{D}_{\text{Bg}}$ are all pixels belonging to the background. The total loss is a weighted sum between all losses. More details about the training in Supplementary \[subsec:losses\].

# Experiments

**Synthetic Dataset.** We create a new object-centric dataset using BlenderProc [@Denninger2023] to generate PBR images given the CAD object models as provided by a subset of Objaverse [@objaverse], GSO [@9811809], and OmniObject3D [@wu2023omniobject3d], resulting in a total of 11077 different objects. We deem this necessary as there is -- to the best of our knowledge -- no available dataset of comparable object variety with sufficiently high but also balanced distribution of views per object. For the following experiments, a single network is trained on parts of Objaverse and all OmniObject3D models. We supervised the training by evaluating on GSO objects, no fine-tuning or training on any of the objects present in the BOP benchmark is performed. For additional information we refer to Supplementary \[subsec:synthetic_data_generation\].

**Implementation.** We train our method on the aforementioned synthetic dataset and resize the respective, artificially corrupted object bounding box crops to $224 \times 224$. We train for 400k steps (roughly 2000 epochs) with a maximum learning rate of $1\times10^{-4}$ on which we apply a linear warm-up of 5000 steps followed by standard cosine annealing. The ViT backbone is trained with a separate maximum learning rate of $1\times10^{-5}$. As ViT we use DINOv2 [@oquab2023dinov2] and DPT [@Ranftl_2021_ICCV] as regression head. Optimization is performed using AdamW [@loshchilov2018decoupled]. Training takes roughly 10 days on 16 A100 GPUs with an effective batch size of 128, whereas the following experiments are run on a single A100 GPU.

**Experimental Setup.** We evaluate our method's capability to perform multiple few-shot perception tasks in a model-free setting, i.e. no CAD model is given, and a model-based setting, i.e. a CAD model is given only during inference but not during training. Following the BOP challenge's [@hodan_bop_2024] dataset split we use the T-LESS [@hodan2017tless], TUD-L [@Hodan_2018_ECCV] and YCB-V [@xiang2018posecnn] datasets for model-based evaluation and the HOPEv2 [@tyree2022hope] and HANDAL [@handaliros23] datasets for model-free evaluation. As metrics, we use *Average Precision (AP)* and *Average Recall (AR)* as defined in [@hodan_bop_2024]. In the model-free setup we use 32 randomly picked real RGB templates from the static onboarding videos provided by the BOP benchmark to generate the NeMO representation while in the model-based setting 32 PBR rendered images are used. The NeMO coordinate system is aligned with the ground truth object coordinate system as described in Supplementary \[subsec:object_alignment\] for evaluation purposes only. The dense decoder outputs are used for detection, segmentation and 6DoF pose estimation as described in Supplementary \[subsec:dense_to_pred\]. Note that in both settings, the network weights are not changed, i.e. no finetuning is performed and the objects have never been seen during training. Additionally, we extensively ablate the NeMO representation and its influence on the downstream tasks in \[subsec:ablations\] and show qualitative object surface reconstruction results of unknown objects in \[subsec:mf_reconstruction\]. The same network is used for all experiments if not stated otherwise.

## Model-Free Few-Shot Perception

| Method | HOPEv2 | HANDAL |
|:---|:--:|:--:|
| CNOS (SAM) - Static onboarding [@nguyen_cnos_2023] | 0.345 | -- |
| dounseen-SAM-CTL [@gouda2023dounseen] | 0.380 | -- |
| GFreeDet-FastSAM [@liu2025gfreedet] | 0.364 | 0.255 |
| GFreeDet-SAM [@liu2025gfreedet] | <u>0.384</u> | <u>0.264</u> |
| Ours | **0.411** | **0.273** |

*Table — **Model-Free Detection.** We compare AP on BOP test splits of HOPEv2 and HANDAL against other methods published on the public Model-Free Unseen Object 2D Detection leaderboard [@leaderboard_model_free_det].*

| Method | Detections | HOPEv2 | HANDAL |
|:---|:---|:--:|:--:|
| OPFormer† | CNOS [@nguyen_cnos_2023] | **0.335** | 0.204 |
| Ours | CNOS [@nguyen_cnos_2023] | 0.307 | -- |
| Ours | GFreeDet-FastSAM [@liu2025gfreedet] | <u>0.329</u> | <u>0.213</u> |
| Ours | NeMO | 0.302 | **0.235** |

*Table — **Model-Free 6DoF Pose Estimation.** We compare AP on BOP test splits of HOPEv2 and HANDAL against other methods published on the public Model-Free Unseen Object 6D Detection leaderboard [@leaderboard_model_free_poseest].  indicates unpublished methods.*

![**Qualitative Example of Model-Free Few-Shot Detection and Pose Estimation on HOPEv2.** Left shows the scene without annotations, right shows NeMO detections in green and pose estimations with refinement as rendered overlays. Even in the underexposed scene the model predicts reasonable results.](media/hopev2_ICP_dense_nemo.png)

**Model-Free Detection.** \[tab:model_free_det_results\] shows the AP results of our model-free amodal detection on HOPEv2 and HANDAL datasets compared to all other publicly listed results. Our method achieves state-of-the art performance on both datasets, outperforming the previous best method by 2.7pp on HOPEv2 and 1.9pp on HANDAL. While all other methods rely on SAM [@Kirillov_2023_ICCV; @zhao2023fast] segmentations of the scene for their bounding box predictions, we are, to the best of our knowledge, the first to use a single network to predict amodal segmentations/detections in a model-free setting. While SAM is able to give modal object segmentations, we can predict amodal segmentations based on the NeMO representation, which we use to create amodal bounding boxes. Note that in the model-free category, the BOP benchmark does only evaluate amodal detection, no segmentation.

**Model-Free 6DoF Pose Estimation.** We evaluate our model's capability for 6DoF Pose Estimation in a model-free setting on the HOPEv2 and HANDAL datasets using different detections in \[tab:model_free_poseest_results\]. On HOPEv2 we use ICP [@besl_1992_icp] between our estimated object surface and the depth information while no refinement is used on HANDAL, since no depth data is available. An example can be seen in \[fig:hopev2_preds_ICP\]. Compared to the only other method OPFormer we achieve state-of-the-art results on HANDAL when using NeMO detections while being on par when using GFreeDet-FastSAM detections. When using the default CNOS detection as provided by the BOP benchmark, we are 2.8pp behind OPFormer. Note that as of the time of writing, no default CNOS detections for HANDAL are available anymore. Although our detections outperform previous methods on HOPEv2 they do not provide an AP gain for pose estimation. We hypothesize that the detection improvements come from our models ability to predict amodal bounding boxes, which is beneficial for the detection evaluation but might not always be an improvement for pose estimation.

**Model-Free Object Reconstruction.**

![](media/reconstruction_example.png)

*Figure — **Object Surface Reconstruction and Camera Pose Estimation on Unseen Objects.** We show object surface points and camera poses as predicted by the decoder based on four images of randomly chosen objects in different scenarios: (Left) A static coffee machine standing on a table, captured by a dynamic camera. (Middle) A label machine in different environments, including occlusions. (Right) An espresso mug manipulated in hand, captured by a static camera. In all three scenarios, our model is able to predict object-centric camera poses and surface points. We map RGB pixel color to corresponding 3D point to show correct 2D-3D mapping. Blue is the anchor image.*

We qualitatively show object surface reconstruction on random objects in different scenarios in \[fig:reconstruction_examples\].

## Model-Based Few-Shot Perception

| Method | T-LESS | TUD-L | YCB-V |
|:---|:--:|:--:|:--:|
| CNOS(Fast Sam) [@nguyen_cnos_2023] | 0.395 | 0.534 | 0.568 |
| SAM6D-FastSAM [@Lin_2024_CVPR] | 0.417 | 0.546 | 0.573 |
| SAM6D [@Lin_2024_CVPR] | 0.458 | 0.573 | 0.589 |
| F3Dt2D† | <u>0.482</u> | 0.573 | 0.666 |
| MUSE† | 0.467 | 0.590 | <u>0.674</u> |
| anonymity† | 0.477 | <u>0.593</u> | **0.685** |
| NIDS Net [@lu2024adapting] | **0.493** | 0.486 | 0.621 |
| Ours | 0.183 | **0.623** | 0.602 |

*Table — **Model-Based Detection.** We compare AP on BOP test splits of T-LESS, TUD-L and YCB-V against other methods published on the public Model-Based Unseen Object 2D Detection leaderboard [@leaderboard_model_based_det].  indicates unpublished methods.*

| Method | T-LESS | TUD-L | YCB-V |
|:---|:--:|:--:|:--:|
| CNOS(Fast Sam) [@nguyen_cnos_2023] | 0.374 | 0.480 | 0.599 |
| SAM6D-FastSAM [@Lin_2024_CVPR] | 0.420 | 0.517 | 0.621 |
| SAM6D [@Lin_2024_CVPR] | 0.451 | 0.569 | 0.605 |
| NOCTIS [@gandyra2025noctisnovelobjectcyclic] | 0.479 | 0.583 | <u>0.684</u> |
| LDSeg† | <u>0.488</u> | <u>0.587</u> | 0.647 |
| MUSE† | 0.451 | 0.565 | 0.672 |
| Prisma-MPG + SG† | 0.454 | **0.590** | 0.607 |
| anonymity† | 0.464 | 0.569 | **0.688** |
| NIDS Net [@lu2024adapting] | **0.496** | 0.556 | 0.650 |
| Ours | 0.169 | 0.488 | 0.579 |

*Table — **Model-Based Segmentation.** We compare AP on BOP test splits of T-LESS, TUD-L and YCB-V against other methods published on the public Model-Based Unseen Object 2D Segmentation leaderboard [@leaderboard_model_based_seg].  indicates unpublished methods.*

| Method | Detections | T-LESS | TUD-L | YCB-V |
|:---|:---|:--:|:--:|:--:|
| Ours | NeMO | 0.082 | 0.466 | 0.493 |
| Ours | ground truth | 0.295 | 0.538 | 0.566 |
| ZS6D [@ausserlechner_zs6d_2024] | CNOS [@nguyen_cnos_2023] | 0.210 | -- | 0.324 |
| MegaPose [@labbe_megapose_2023] | CNOS [@nguyen_cnos_2023] | 0.177 | 0.258 | 0.281 |
| GenFlow [@Moon_2024_CVPR] | CNOS [@nguyen_cnos_2023] | 0.215 | 0.300 | 0.277 |
| GigaPose [@nguyen_gigapose_2024] | CNOS [@nguyen_cnos_2023] | 0.264 | 0.300 | 0.278 |
| FoundPose [@ornek2024foundpose] | CNOS [@nguyen_cnos_2023] | <u>0.338</u> | 0.469 | 0.452 |
| Co-op [@Moon_2025_CVPR] | CNOS [@nguyen_cnos_2023] | **0.592** | **0.642** | **0.626** |
| Ours | CNOS [@nguyen_cnos_2023] | 0.190 | <u>0.476</u> | <u>0.504</u> |

*Table — **Model-Based 6D Localization of Unseen Objects without Refinement.** We report AR on 3 BOP datasets and compare with current SOTA model-based RGB based pose estimation methods *without refinement*. We use the default CNOS [@nguyen_cnos_2023] detections provided by the BOP challenge when indicated. Data taken from [@Moon_2025_CVPR].*

This section discusses results of our network on model-based perception. Although the network has never been trained on rendered template images with black background and real query images, it performs on par and partially outperforms previous methods specialized on this task.

**Model-Based Detection.** AP for amodal detection on T-LESS, TUD-L and YCB-V datasets is reported in \[tab:model_based_det_results\]. We achieve state-of-the-art results on TUD-L, outperforming the previous best method by 3pp. On YCB-V we would rank 6th out of 13 methods reported on the BOP leaderboard. On T-LESS we achieve a precision of 0.183, which is probably due to the strong similarities between the objects, the lack of texture as well as the dataset containing many cluttered scenes with objects of the same instance. All these factors are not present in our training data.

**Model-Based Segmentation.** In addition to detection we also report object segmentation AP on the three datasets. We report the results in \[tab:model_based_seg_results\]. Compared to other networks our method is less precise on pixel level, which could be due to border artifacts as a results of patch-scaling. As with the detection results, the precision on T-LESS is low, which we attribute to the same reasons as mentioned above.

**Model-Based Refiner-Free 6DoF Pose Estimation.** To evaluate the 6DoF Pose Estimation capabilities of our method independent of the detection quality we report the *average recall AR* on T-LESS, TUD-L and YCB-V with default CNOS [@nguyen_cnos_2023] detection and *without additional refinement step* in \[tab:mb_6dof_results_no_refinement\] as is standard practice in the literature. Although our network was not designed for the model-based category we achieve high results in TUD-L and YCB-V, while only Co-op [@Moon_2025_CVPR] achieves better results. Our method fails to handle the symmetric and textureless objects in T-LESS, which is reflected on the low average recall of 0.190. In addition we report the results of our method using ground truth and NeMO detections. Surprisingly, although the NeMO detections show higher precision than the CNOS detections as reported in \[tab:model_based_det_results\], the average recall on pose estimation task is lower when using NeMO detections. This is due to the difference in how average precision and average recall are evaluated. For results on model-based pose estimation with refinement we refer to Supplementary \[tab:mb_pose_est_with_refinement\].

## Analyzing the NeMO Representation

In this section we analyze the properties of the NeMO representation. For all experiments we report AP of 6DoF pose estimation on the test split of YCB-V with real template images randomly chosen from the public real training set provided by the BOP benchmark [@hodan_bop_2024]. We use ground truth detections and no refinement unless stated otherwise. A smaller decoder that only outputs pointmap and confidence is used in this section. Additional experiments and analyses can be found in Supplementary \[subsec:additional_nemo_analyses\].

**Varying number of template images.** We show the relation between the number of template images used to generate a NeMO and its influence on 6DoF pose estimation and the required memory footprint in \[fig:ap_mem_vs_num_templates\]. It shows that while more template images enhance precision, acceptable performance is already achieved with just three views. We emphasize the fact that whereas the number of templates increases, the runtime and memory consumption of our decoder model stays quasi constant while the precision increases. Since we generate our NeMOs before the inference task, we shift the computational heavy part of attending all template features with each other to the offline phase.

| \# NeMO Points | AP $\uparrow$ | AP$_{\text{MSPD}}$ $\uparrow$ | AP$_{\text{MSSD}}$ $\uparrow$ | Time/Image (s) $\downarrow$ |
|:--:|:--:|:--:|:--:|:--:|
| 10 | 0.004 | 0.005 | 0.002 | 0.402 |
| 50 | 0.112 | 0.130 | 0.094 | 0.671 |
| 100 | 0.214 | 0.231 | 0.196 | 0.460 |
| 200 | 0.290 | 0.297 | 0.282 | 0.393 |
| 500 | 0.380 | 0.379 | 0.381 | 0.340 |
| 1000 | 0.383 | 0.389 | 0.376 | 0.320 |
| 1500 | 0.378 | 0.37 | 0.385 | 0.336 |

*Table — **Number of NeMO Input Points vs AP.** We report the AP on YCB-V 6D pose estimation with ground truth detections by varying number of randomly sampled input points.*

**Varying number of NeMO Points.** Although the model was trained on a fixed sized number of input points $\mathcal{Q}$ we show in \[tab:num_nemo_points_vs_ap\] that the encoder and decoder can adapt to different point cloud sizes, allowing for a dynamic adaptation of the models memory consumption and precision. We observe that the precision increases as the number of NeMO points increases up to 500 where it stagnates around 0.38. A visualization of NeMO features can be seen in \[fig:method\].

**Transforming NeMO coordinate system.** During training, we randomly transform our NeMO point cloud before passing it to the decoder. In this section we evaluate if the decoder adapts its output based on the positions of the NeMO points. To test the rotation-equivariance between the NeMO point cloud and the predicted pointmaps $X$ of the template images, we rotate the NeMO point cloud around the z-axis in 10 degree steps and evaluate the Chamfer distance [@fan_cvpr_2017] between the predicted pointmap and the ground truth CAD model rotated by the same angle. As can be seen in Supplementary \[fig:nemo_rot\], the Chamfer distance [@fan_cvpr_2017] between the pointmaps and the ground truth CAD model remains low while the Chamfer distance between a non-rotating pointmap varies, indicating that the pointmap prediction is rotating accordingly. This is an interesting property of our network for future work, in which parts of the NeMO could be transformed online during inference.

**Extending NeMO.** As the NeMO representation is based on a set of points, it can easily be extended. To see if the addition of new points from a different NeMO of the same object leads to better results, we combine two NeMOs with the same anchor image. In Supplementary \[tab:extending_nemo\] we show the Chamfer distance between the predicted pointmap and the ground truth CAD model for the original NeMO and the extended one, observing that the Chamfer distance is lower for the extended NeMO than for the original one. This shows that we can combine two sets of NeMO points without disturbing the decoder while improving its performance. This is beneficial in scenarios, where the hardware is memory limited and thus, fewer template images can be used.

![](media/num_temp_vs_mem_and_ap.png)

*Figure — **Memory consumption and AP on 6DoF Pose Estimation vs. Number of template images.** While the offline NeMO generation requires more memory as the number of template images increases, the inference memory remains constant. Additionally, more template images increase the AP on 6DoF Pose Estimation on YCB-V with ground truth detections.*

# Limitations

Despite promising results, our method exhibits several limitations. The encoder is trained to predict surface points, which leads to difficulties with symmetric objects, as demonstrated on the T-LESS dataset. We attribute this not to the pointmap representation itself, but to limitations in the current training procedure; addressing this will require further research. Additionally, the encoder performs poorly on highly textureless objects, likely due to their underrepresentation in the training set. Future work will focus on scaling the dataset to include a broader and more diverse set of objects. Another limitation is that the encoder does not directly predict bounding boxes; instead, segmentation masks are used as a proxy. This can result in merged bounding boxes when multiple instances of the same object are present---an issue we plan to resolve in future work.

# Conclusion

In this work, we presented an encoder and decoder architecture for Neural Memory Object (NeMO), a general and versatile object-centric representation that can be used for few-shot perception tasks such as object detection, segmentation and pose estimation using only an unordered set of RGB images. Through thorough experiments, we demonstrated that our method can be used for few-shot, model-free and model-based unseen perception task, partially outperforming state-of-the-art methods. Our approach differs to alternative methods by

being capable to incorporate information from multiple RGB recorded images into a single representation without any camera parameters,

utilizing a single network for multiple perception tasks,

having constant inference time and memory requirements regardless of the number of template images,

predicting amodal segmentation masks without CAD-model,

being able to incorporate CAD-model information if given,

allowing dynamically changing memory usage and precision, based on hardware capabilities,

outsourcing the object's information from the network weights, allowing for quick adaptation to novel objects without retraining.

Furthermore, we contribute a realistic large-scale and balanced object-centric dataset that we deem beneficial for the broader research community. Future work includes combining multiple NeMOs for articulated objects. Additionally, we strive to increase robustness of the applied task-specific encoder w.r.t. symmetrical and textureless objects as motivated by the results on the T-LESS dataset. We hope this work stimulates discussion on decoupling object knowledge from model weights and helps advance model-free few-shot perception for unseen objects.

# Supplementary Material

![](media/mlp_visualization.png)

*Figure — **MLP Block with Skip-Connections.***

## Synthetic Training Data Generation

For the generation we proceed as following: We pick a random number of objects, sample them in a scene and render 20 PBR images from random camera positions focusing on a random object in the scene for each camera position. The scenes vary in objects placed

randomly on the ground,

flying in space, or

in an upright standing position.

We keep generating scenes until all objects have been seen (i.e. at least 40% visibility) at least 64 times in at least 8 different scenes. Afterwards we convert the scene-centric into a highly efficient object-centric format by mapping the object id to all images where they occur, giving us at least 64 random views for each object in each scene type. See \[fig:synt_imgs\] for some example images from the training set.

## Losses

**Encoder loss.** To enforce the encoder to predict towards ground truth surface points we define a simple regression loss that minimizes the Euclidean distance between the estimated surface point $s_{i} = q_{i} - \widetilde{\mathcal{U}}(q_{i}) \times \frac{d\widetilde{\mathcal{U}}(q_{i})}{dq_{i}}$ with $\widetilde{\mathcal{U}}(q_{i}) := \mathcal{U}\left(\widehat{f_{i}}^{\mathcal{Q}}\left(q_{i}\right)\right)$ and the ground truth surface point $\bar{s}_{i}$:

$$
\text{L}_{\chi}= \frac{\sum_{i=1}^{M} \lVert s_{i}-\bar{s}_{i}\rVert}{M},
$$

with $M = |\chi|$. We do not directly enforce any loss on the NeMO features $\widehat{\mathcal{F}}^{\mathcal{Q}}$ so that they can be freely learned through backpropagation through the decoder. During training, after $\Psi$ has predicted $\chi$, we randomly rotate, translate and scale the NeMO points $s_{i}$ by a random transformation $\mathbf{T}$ to teach the decoder to learn a coordinate system that is independent of the anchor image $I_{\text{A}}$.

**Dense Prediction Losses.** We define additional losses on the dense predictions of the decoder $\Theta$. For the modal and amodal segmentation losses $\text{L}_{\text{modal}}$ and $\text{L}_{\text{amodal}}$ we use an equally weighted dice- and binary cross-entropy loss. The pointmap is learned using a confidence weighted L1 loss: We define the set of valid pixels in $I_{\text{q}}$ belonging to the object as $\mathcal{D}_{\text{Obj}}$. As in [@wang_dust3r_2024] we define a regression loss between the estimated 2D-3D correspondences $X$ and the ground truth mapping $\bar{X}$:

$$
\text{L}_{\text{2D3D}} = \frac{\sum\limits_{i \in \mathcal{D}_{\text{Obj}}} \widetilde{C}_{i}\lVert X_{i} - \bar{X}_{i} \rVert}{\mid \mathcal{D}_{\text{Obj}} \mid} \quad
$$

where $\widetilde{C}_{i}=1+\exp{C_{i}}$ makes sure that a confidence of zero does not lead to diminishing gradients. Note that during training we transform the ground truth correspondences $\bar{X}$ by the same transformation $\mathbf{T}$ as applied to the points $s_{i}$ in $\chi$. Different to [@wang_dust3r_2024], we explicitly enforce certainty on pixels belonging to the object and uncertainty on pixels that do not belong to the object:

$$
\begin{aligned}
        \text{L}_{\text{certain}}   & = \frac{\sum\limits_{i \in \mathcal{D}_{\text{Obj}}} \Bigl( 1 - \tanh\bigl(\exp(C_{i})\bigr) \Bigr)}{\left| \mathcal{D}_{\text{Obj}} \right|} \\
        \quad \text{L}_{\text{uncertain}} & = \frac{\sum\limits_{i \in \mathcal{D}_{\text{Bg}}} \Bigl(\tanh\bigl(\exp(C_{i})\bigr)\Bigr)}{\left| \mathcal{D}_{\text{Bg}} \right|}
    \end{aligned}
$$

where $\mathcal{D}_{\text{Bg}}$ are all pixels not belonging to the object. Based on the introduced losses, we define the total training loss as:

$$
\begin{align}
\label{eq:total_loss}
    \text{L}_{\text{total}} &= \alpha (\text{L}_{\chi} + \text{L}_{\text{2D3D}}) \nonumber \\
    &\quad + \beta (\text{L}_{\text{certain}} + \text{L}_{\text{uncertain}} + \text{L}_{\text{modal}} + \text{L}_{\text{amodal}}),
\end{align}
$$

where $\alpha, \beta$ are hyper-parameters. During training we set $\alpha=1.0, \beta=0.2$.

## Training Details

**Sample Structure.** We define each sample in a batch as ten randomly picked images from the training set showing the same object and 1500 sampled points in the volume $[-1, 1]^{3}$. Five of the images are used as template images for the encoder to generate a NeMO, while all ten images are used as input to the decoder. The total loss as defined in \[eq:total_loss\] includes the encoder as well as multiple dense decoder losses, training the encoder and decoder jointly. While the five images used for the NeMO generation always show the same object with small variations in the bounding box, the other five images have a 30% chance of being a completely random crop from the scene. This allows the decoder to learn to ignore images in which the object is not shown while also improving the decoder's capability to find the object in cluttered scenes.

**Data Augmentation.** In $2/3$ of the samples we use 1500 uniform sampled 3D points in the volume $[-1, 1]^{3}$ as input $\mathcal{Q}$ while in $1/3$ of the samples we use 1500 points sampled close to the surface of the CAD model of the object. Due to the self-attention mechanism in the encoder, this allows us to train the model to use the CAD model information if available, while also being able to work without it. As pixel-level data augmentation to all templates in a sample, we apply:

- 30% chance of color jitter with 0.5 brightness, 0.5 contrast, 0.5 saturation and 0.5 hue, and

- 10% chance of grayscale,

On template images directly we apply:

- 50% chance of random affine transformation with up to $5^\circ$ rotation, 0.1 translation and 0.1 scaling, and

- 50% chance of Gaussian noise with standard deviation between 0 and 0.05.

**Initial NeMO Space.** To define the initial coordinate system based on the anchor image $I_{\text{A}}$, we use the mean of the ground truth surface points as the center of the NeMO space and the orientation of the anchor image as it is in the camera frame in OpenCV notation. The scale of the NeMO point cloud is defined such that the anchor image's surface points take $1/3$ of the volume $[-1, 1]^{3}$.

## Object Alignment

As the BOP challenge compares the predicted object pose against the ground truth pose, we need to align the coordinate system of our NeMO with the ground truth object pose to be able to evaluate our approach. Note that this is only required for evaluation and generally not a necessity of our method. As we are given the object-to-camera transformation both in the model-based, where we render our templates, and in the model-free setting, where we are given the ground truth pose, we can align our coordinate system by optimizing the scale, rotation and center-offset. We use a simple gradient descent optimization that minimizes the error between the predicted and ground truth pose of the $\text{k}=5$ best rotation predictions of the template images. See \[alg:align\] for the pseudo code of the alignment algorithm.

## From Dense Predictions to Detection, Segmentation and 6DoF Pose Estimation

Since our decoder produces dense predictions, we need additional steps to get a 6DoF pose estimation and amodal bounding box. These predictions are run in parallel using multiple decoder and different NeMOs. To predict the segmentations and amodal bounding boxes of a scene, we patchify the scene image with two patch sizes (smallest image side and half the smallest image side) with a stride of $1/3$ of the patch size. We accumulate the patch predictions and look for clusters of predictions larger 0 to differentiate between object instances. The amodal bounding box is retrieved by laying a box around a amodal segmentation cluster. We ignore small clusters and clusters touching the image sides. To predict the 6DoF pose estimation, we crop the region from a bounding box and all pixels with a minimum confidence value of 0.1 in the 2D-3D correspondences. We then compute the pose by solving the PnP problem using OpenCV's `solvePnPRansac` function with `iterationsCount 500`, `reprojectionError 6` and `min inlier ratio` of 30%.

**Algorithm 1 — NeMO Alignment** (evaluation only)

- *Require:* GT poses $T^\text{gt}_i \in SE(3)$, estimated poses $T^\text{est}_i \in SE(3)$, max iterations $N$, learning rate $\eta$, Huber threshold $\delta$, number of best poses $k$
- *Ensure:* optimal scale $s$, rotation $R$, translation $t$ aligning $T^\text{est}$ to $T^\text{gt}$

1. Select $k$ best estimates with lowest initial rotation error
2. Initialize scale $s$ from average translation norms; axis-angle $\mathbf{r} \gets 0$, translation $\mathbf{t} \gets 0$
3. For $i = 1 \ldots N$:
    1. $R \gets \text{AxisAngleToRotation}(\mathbf{r})$; $T^\text{corr} = \begin{bmatrix} R & \mathbf{t} \\ 0 & 1 \end{bmatrix}$
    2. $\hat{T}_i \gets T^\text{est}_i \cdot T^\text{corr}$; compute $\hat{R}_i$ and scaled $\hat{t}_i$
    3. $\theta_i = \angle(\hat{R}_i, R^\text{gt}_i)$, $\epsilon_i = \lVert \hat{t}_i - t^\text{gt}_i \rVert$
    4. $L = \text{Huber}(\theta) + \text{Huber}(\epsilon / 10)$; Adam step on $s, \mathbf{r}, \mathbf{t}$
    5. If $L < L_\text{best}$: save $s, R, \mathbf{t}$
4. Return $s$, $R$, $t$

## Additional NeMO Analyses

**Similarity between predicted and ground truth object surface.** We show the close resemblance of our dense point cloud by measuring the Chamfer distance to the ground truth point cloud. The prediction is based on two different point cloud sampling methods as input to our NeMO. Both methods achieve strong results in \[tab:cd_pc_sampling\] across the three datasets with slightly better performance, when the input point cloud is sampled based on the actual CAD model for a given object.

|                 |                               |        |        |
|:---------------:|:-----------------------------:|:------:|:------:|
| Sampling Method | Chamfer Distance $\downarrow$ |        |        |
|                 |             YCB-V             | HOPEv2 | HANDAL |
| Random Sampled  |            0.0055             | 0.0029 | 0.009  |
|   CAD Surface   |            0.0036             | 0.0019 | 0.0022 |

*Table — **Chamfer distance between ground truth point cloud and dense point cloud prediction based on two different NeMO input sample point clouds.** First, randomly sampled points. Seconds, points sampled on the CAD surface, which requires the model of a given object. We observe already small errors only in case of randomly sampled point clouds as input to our NeMO representation. We further improve this distance when we sample points based on the provided CAD model.*

**CAD-Model Conditioned Sampling.** We compare the performance of our network using randomly sampled $\mathcal{Q}$ and points sampled from the surface of a CAD model. Additionally, we compare different ICP-based refinement strategies:

no ICP,

using the pointmap prediction as source point cloud for the ICP, and

using CAD model surface points as source point cloud for the ICP.

The results are shown in \[tab:icp_pointsampling_ablation\]. We show that our design choice to use a continuous point cloud as input to the encoder can leverage the information from the CAD model to improve the performance of our method. We also show that we can use the pointmap prediction for ICP refinement, although no depth information is given during the encoding step, increasing the average precision compared to purely RGB based (no ICP) pose estimation. An example of estimated object surfaces can be seen in \[fig:2d_3d_conf_ycbv\]. This experiment demonstrates the versatility of our network, allowing us to adapt to different scenarios.

| ICP Method | Point Sampling | AP $\uparrow$ | AP$_\text{MSPD}$ $\uparrow$ | AP$_\text{MSSD}$ $\uparrow$ | Time/Image (s) $\downarrow$ |
|:---|:---|:--:|:--:|:--:|:--:|
| -- | Random | 0.378 | 0.370 | 0.385 | 0.336 |
| -- | CAD Surface | 0.383 | 0.420 | 0.347 | 0.531 |
| Pointmap Surface | Random | 0.475 | 0.394 | 0.557 | 1.720 |
| Pointmap Surface | CAD Surface | 0.507 | 0.447 | 0.567 | 1.479 |
| CAD | Random | 0.671 | 0.639 | 0.703 | 2.049 |
| CAD | CAD Surface | 0.626 | 0.594 | 0.658 | 1.607 |

*Table — **Precision with different point sampling and ICP.** We report the AP on YCB-V with ground truth detections without refinement.*

| Method | T-LESS | TUD-L | YCB-V |  |
|:---|:---|:--:|:--:|:--:|
| Co-op (F3DT2D, Coarse, RGBD)[@Moon_2025_CVPR] | 0.620 | 0.841 | 0.808 |  |
| FreeZeV2.1[@caraffa2024freeze] | 0.751 | 0.991 | 0.905 |  |
| FreeZeV2.2[@caraffa2024freeze] | <u>0.777</u> | <u>0.988</u> | <u>0.911</u> |  |
| FRTPose-WAPP (Default Detection) | **0.826** | 0.978 | **0.918** |  |
| Ours (CNOS Detection) | 0.291 | 0.560 | 0.592 |  |
| Ours (NeMO detection) | 0.144 | 0.756 | 0.567 |  |

*Table — **Model-Based 6D Detection of Unseen Objects with Refinement.** We report AP on 3 BOP datasets and compare against other methods published on the public Model-Based Unseen Object 6D Detection leaderboard. [@leaderboard_model_based_poseest]. We used a simple ICP as refinement step.  indicates unpublished methods.*

![**Training Images.** From left to right, respectively: RGB input, ground truth 2D3D mapping, ground truth amodal segmentation, estimated 2D-3D mapping and estimated confidence, estimated modal segmentation and estimated amodal segmentation. Shown are three different training samples, each sample consists of 10 images. The first 5 images are used to generate a NeMO, all 10 images are used for dense predictions. Note that in the last 5 templates of a sample, the object crop is stronger augmented and sometimes the object is not visible at all.](media/training_images.png)

![**NeMOs from benchmark objects.** We show the NeMOs (left, with PCA feature visualization), dense predictions (middle) and object surface reconstruction (right) from objects selected from different datasets. From top to bottom, the datasets are: HANDAL, HOPEv2, YCB-V and T-LESS. We use 32 template images to generate the NeMOs and use the same 32 images to show the dense prediction results. We show real template images for HANDAL, HOPEv2 and YCB-V and synthetic template images for the T-LESS object. NeMOs are aligned with ground truth poses as described in \[subsec:object_alignment\].](media/nemos_figure_combined.png)

![](media/2d_3d_mappting_ycbv.png)
![](media/2d_3d_mappting_ycbv01.png)

*Figure — **Pointmap predictions** on the YCB-V dataset. We only show estimations with confidences $> 0.1$.*

![](media/nemo_rot.png)

*Figure — **Chamfer distance between dense predicted and rotated ground truth point cloud** averaged across all objects of respective dataset. In case objects and NeMOs are rotated analogously, we observe small errors i.e. the point clouds are very similar. M-shaped error trajectory, with minimum around 180 degrees of rotation around objects' z-axis, in case of fixed 2D-3D dense representation but rotated ground truth object point cloud. This shows that our representation is aware of rotations.*

|                 |                               |        |        |
|:---------------:|:-----------------------------:|:------:|:------:|
| NeMO Generation | Chamfer Distance $\downarrow$ |        |        |
|                 |             YCB-V             | HOPEv2 | HANDAL |
|      Fused      |            0.0080             | 0.0034 | 0.0088 |
|  All Templates  |            0.0081             | 0.0034 | 0.0084 |

*Table — **Chamfer distance between ground truth point cloud and dense point cloud prediction based on two different NeMOs.** First, a fused NeMO based on two respective NeMOs generated through 4 images each but each with the same anchor image. Second, predicted dense point cloud based on all 7 template views. This shows the versatility of our NeMO as the point cloud resemblance and error stays constant.*
