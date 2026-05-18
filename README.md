# Climate-Change-and-its-Impact-on-Health
This repository features a production-grade, end-to-end distributed analytical framework designed for high-throughput environmental data processing and predictive modeling. The architecture leverages a heterogeneous stack combining Hadoop HDFS for persistent storage, Apache Spark for distributed computation, and Kubernetes for cloud-native orchestration.

🏗️ System Architecture and Data Ingestion
The ingestion layer utilizes automated scripts to interface with NASA (GISS) and NOAA (NCEI) datasets, retrieving global surface temperature anomalies and precipitation indices. Raw data is ingested into a Hadoop Distributed File System (HDFS) cluster to ensure fault-tolerant data management and high-volume scalability. The ETL pipeline, built on Apache Spark, transforms raw CSV data into a partitioned Parquet schema, which optimizes downstream read operations through columnar compression and enhanced I/O performance.

🤖 Distributed Machine Learning Pipeline
Predictive modeling is executed via the Spark MLlib library. The framework implements a Random Forest Regressor, selected for its robustness in handling non-linear relationships within complex environmental datasets. Feature engineering is centralized through a VectorAssembler transformer, which synthesizes multi-variate inputs—including temperature anomalies, precipitation levels, and sea-level metrics—into a consolidated feature vector for distributed training. Model accuracy is rigorously evaluated using Root Mean Squared Error (RMSE) to ensure the statistical reliability of the forecasts.

📊 Interactive Visualization and Real-Time Inference
The application layer is a Dash web interface that integrates Plotly for high-fidelity visualizations of climate trends. The dashboard supports real-time inference by utilizing a pre-trained serialized model (via joblib) to provide instantaneous temperature forecasts based on user-defined coordinates (latitude/longitude) and temporal parameters.

🚀 Containerization and Production Orchestration
For infrastructure consistency, the environment is containerized using Docker images based on python:3.8-slim and optimized with essential C-extension compilers like gcc. Production deployment is managed via Kubernetes (K8s), utilizing a Deployment controller with a three-replica strategy for horizontal scaling and high availability. A K8s Service with a LoadBalancer type manages ingress traffic and distributes user requests across the compute cluster.

🔬 Multi-Domain Extensibility
The modular nature of this High-Performance Computing (HPC) pipeline is designed for extensibility. By swapping the data ingestion layer and adjusting the MLlib configuration, this architecture can be adapted for other high-dimensional analytical tasks, such as automated breast cancer detection. In such scenarios, the distributed Spark infrastructure can be utilized for large-scale histopathology image processing or genomic vectorization, maintaining the same high-availability deployment patterns used here.
