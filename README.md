# 💳 Credit Card Fraud Detection using KNN

## 📌 Project Overview

This project is a Machine Learning-based Credit Card Fraud Detection system built using the K-Nearest Neighbors (KNN) algorithm.  
It detects fraudulent transactions using a real-world highly imbalanced dataset and includes a complete end-to-end ML pipeline.

---

## 🎯 Objective

To build a classification model that can accurately detect fraudulent transactions while minimizing false negatives.

---

## 📊 Dataset

- Source: Kaggle Credit Card Fraud Detection Dataset  
- Total Transactions: 284,807  
- Fraud Transactions: 492  
- Features: PCA-transformed numerical features + Time + Amount  
- Target: Class (0 = Legit, 1 = Fraud)

---

## 🧠 Model Used

- Algorithm: K-Nearest Neighbors (KNN)  
- Feature Scaling: StandardScaler  
- Hyperparameter Tuning using F1-Score  
- Cross Validation using Stratified K-Fold  

---

## 🔄 Project Workflow

Data Loading → EDA → Train-Test Split → Feature Scaling → Model Training → Hyperparameter Tuning → Cross Validation → Evaluation → Threshold Optimization → Final Prediction

---

## 📈 Evaluation Metrics

- Precision  
- Recall  
- F1 Score  
- ROC-AUC Score  
- Confusion Matrix  
- ROC Curve  
- Precision-Recall Curve  

---

## 📊 Key Features

- End-to-end ML pipeline  
- Fraud transaction detection  
- KNN hyperparameter tuning  
- Cross-validation support  
- Threshold optimization  
- Evaluation metrics visualization  
- Exploratory Data Analysis (EDA)

---

## 🗂 Project Structure

```bash
credit-card-fraud-detection-knn/
│
├── data/
│   └── raw/
│       ├── credit_card_zip_data.zip
│       └── creditcard.csv
│
├── src/
│   ├── data_preprocessing.py
│   ├── model.py
│   ├── evaluate.py
│   └── utils.py
│
├── notebooks/
│   └── credit_fraud.ipynb
│
│
│   
├── pyproject.toml
├── main.py
├── Makefile
├── gitignore.txt
├── Dockerfile
├── requirements.txt
└── README.md
🚀 How to Run
1. Clone Repository
https://github.com/Subinthapa2092/credit-card-fraud-detection-knn.git
cd fraud-detection-knn
2. Install Requirements
pip install -r requirements.txt
3. Run Project
python main.py
📦 Requirements
Python 3.8+
numpy
pandas
matplotlib
seaborn
scikit-learn
📌 Key Insights
The dataset is highly imbalanced
Recall is important for fraud detection
Threshold tuning improves fraud detection performance
KNN performs better after feature scaling
👨‍💻 Author
Subin Thapa

Data Science Student from Nepal
Aspiring Data Analyst & Trader

I document my learning journey through hands-on projects, practical datasets, and continuous learning in Data Science.

🚀 Future Improvements
Implement Random Forest and XGBoost
Handle imbalance using SMOTE
Deploy using Streamlit or Flask
Build real-time fraud detection API
Add model saving and loading functionality
