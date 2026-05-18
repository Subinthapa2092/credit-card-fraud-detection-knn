# ─────────────────────────────────────────────────────────────────
#  Credit Card Fraud Detection
#  Base image: official Python 3.11 slim (small & production-safe)
# ─────────────────────────────────────────────────────────────────
FROM python:3.11-slim

# Metadata
LABEL maintainer="Subin Thapa <subinthapa2092@github.com>"
LABEL project="credit-card-fraud-detection"
LABEL version="1.0"

# ── System dependencies ──────────────────────────────────────────
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# ── Working directory inside the container ───────────────────────
WORKDIR /app

# ── Install Python dependencies ──────────────────────────────────
#    Copy requirements first so Docker can cache this layer
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# ── Copy project files ───────────────────────────────────────────
COPY . .

# ── Create output directories if they don't exist ────────────────
RUN mkdir -p data models reports/figures logs

# ── Expose Jupyter port ──────────────────────────────────────────
EXPOSE 8888

# ── Default command: launch Jupyter Notebook ─────────────────────
CMD ["jupyter", "notebook", \
     "--ip=0.0.0.0", \
     "--port=8888", \
     "--no-browser", \
     "--allow-root", \
     "--NotebookApp.token=''", \
     "--NotebookApp.password=''", \
     "--notebook-dir=/app/notebooks"]
