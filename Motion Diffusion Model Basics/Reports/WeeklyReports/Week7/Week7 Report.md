# Week7 Report

<aside>

## ✅ Tasks Completed

</aside>

- **Resolved Step 3 Conversion Pipeline:** Identified and fixed a coordinate mismatch issue in the custom conversion script. The issue was discovered in week3 and was mentioned in the report, it is now resolved. To guarantee absolute compatibility with downstream diffusion models, I also replaced the custom implementation with the official standard HumanML3D code.

![HumanModelFloatingAboveGridWithArrowBackwards.png](Week7%20Report/HumanModelFloatingAboveGridWithArrowBackwards.png)

- **Batch Processing Executed:** Successfully ran the new, validated conversion pipeline on the workstation. We now have the complete, corrected 3D motion data for all subjects extracted into the required format. Completing the data proccessing pipeline proposed earlier (week 4):
    
    ![8 - New Data Processing Pipeline.png](Week7%20Report/8_-_New_Data_Processing_Pipeline.png)
    
- **ST-GCN Initiation:** Began setting up the environment and pipeline for training the Spatial-Temporal Graph Convolutional Network (ST-GCN).
- **Demo Video:** Made a few clips of the demo video, convering data proccessing and some sample analysis.
    
    
    ![image.png](Week7%20Report/image.png)
    
    ![Figure_1.png](Week7%20Report/60f7d61b-0655-454a-a55f-66038d32e665.png)
    

<aside>

## 🚧 Problems Encountered & Solutions

</aside>

- **Environment Setback (Hardware):** Experienced an accidental hard drive formatting issue mid-week. The raw data and scripts were recovered, but environment was lost, resulting in a 1–2 day setback.
- **Data Format Mismatch in `pyskl`:** There is a core domain gap between our data and the default `pyskl` library configurations. The datasets supported by this library are **2D skeletons extracted from videos**, it is hard to retrain a detection for our **3D skeletons (HumanML3D)** using exsiting dataset. **Two** solutions are proposed here:
    - *Alternative 1*
    
    ![image.png](Week7%20Report/image%201.png)
    
    - *Alternative 2*
    
    ![image.png](Week7%20Report/image%202.png)
    

<aside>

## 📝 Plan for Week 8

</aside>

1. **Format Adaptation:** Write a data-wrapper script to format our 3D HumanML3D features into an `NTURGB+D` compatible graph structure so `pyskl` can read it natively. The exact format will have to be decided beforehand. 
2. **Baseline Training:** Train the "Hello World" ST-GCN model on our data to establish a baseline classification accuracy (Young vs. Mid vs. Elderly).
3. **Project Page & Video:** Finalize the demo video (combining the VPoser visual results with the initial ST-GCN classification metrics) and publish the GitHub project page.