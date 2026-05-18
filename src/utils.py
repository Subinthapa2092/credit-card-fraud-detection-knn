import numpy as np
from sklearn.metrics import f1_score

def find_best_threshold(y_test, y_proba):
    thresholds = np.arange(0.1, 0.95, 0.05)

    best_t = 0
    best_f1 = 0

    for t in thresholds:
        y_pred = (y_proba >= t).astype(int)
        f1 = f1_score(y_test, y_pred)

        if f1 > best_f1:
            best_f1 = f1
            best_t = t

    return best_t, best_f1