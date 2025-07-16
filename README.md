# Distributed Song Data Processing 
This project focuses on distributed data processing of the [Million Song Dataset](http://millionsongdataset.com/) using Hadoop and Spark. The dataset consists of detailed metadata and audio analysis for one million songs. The original HDF5 files were converted into a simplified ASCII format to ensure compatibility with Hadoop and to enable scalable processing using Spark.

The system ingests preprocessed ASCII files and performs statistical analysis on song data.

## 📜 Scripts Overview

- `convert_h5_to_asc.sh`:  
  Bash script for batch conversion of all `.h5` files to ASCII format prior to ingestion into Hadoop. This step ensures compatibility with HDFS in a distributed environment.

- `\Basic analysis hdf5_to_rdd\MSD-001File_Analysis.ipynb`:  
  Jupyter notebook for computing audio and metadata statistics on a **single song file**.

- `\Basic analysis hdf5_to_rdd\MSD-Analysis_ASCI_FINAL.ipynb`:  
  Final notebook for computing **aggregate statistics** across the entire dataset, including metrics such as average duration, tempo, and loudness.

## 📊 Data Analysis

Aggregate statistics computed from the processed dataset:

| avg(duration) | avg(tempo) | avg(end_of_fade_in) | avg(start_of_fade_out) | avg(time_signature) | avg(time_signature_confidence) | avg(mode_confidence) | avg(mode) | avg(loudness) |
|---------------|------------|----------------------|--------------------------|----------------------|-------------------------------|-----------------------|-----------|---------------|
| 238.51        | 122.92     | 0.76                 | 229.98                   | 3.56                 | 0.51                          | 0.48                  | 0.69      | -10.49        |

## ⚖️ Scaling Experiments

The analysis was designed to support distributed system experiments evaluating scalability. Two types of scaling were investigated:

- **Strong Scaling**:  
  Measures how processing efficiency improves with an increasing number of computational resources (e.g., number of processors), while keeping the dataset size fixed. (`Scalability_Experiments/MSD-Analysis_10000_Strong.ipynb`)

- **Weak Scaling**:  
  Examines how the system handles increased workload as both the dataset size and the number of processors grow proportionally. (`Scalability_Experiments/MSD-Analysis_10000_Weak.ipynb`)
