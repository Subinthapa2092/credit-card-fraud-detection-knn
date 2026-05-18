
from src.data_preprocessing import load_data, split_data, scale_data
from src.model import train_knn
from src.evaluate import evaluate_model
from src.utils import find_best_threshold

# Step 1
df = load_data("data/raw/creditcard.csv")

# Step 2
X_train, X_test, y_train, y_test = split_data(df)

# Step 3
X_train_scaled, X_test_scaled, scaler = scale_data(X_train, X_test)

# Step 4 (MODEL)
model = train_knn(X_train_scaled, y_train, k=5)

# Step 5 (TEST)
results = evaluate_model(model, X_test_scaled, y_test)

print(results)

# Step 6 (Threshold)
y_proba = model.predict_proba(X_test_scaled)[:, 1]
best_t, best_f1 = find_best_threshold(y_test, y_proba)

print("Best Threshold:", best_t)
print("Best F1:", best_f1)