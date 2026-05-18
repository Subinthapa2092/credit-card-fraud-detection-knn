# ═══════════════════════════════════════════════════════════════
#  Credit Card Fraud Detection — Makefile
#  Usage:  make <target>
# ═══════════════════════════════════════════════════════════════

.PHONY: help install notebook run clean docker-build docker-run lint test

# ── Default target ──────────────────────────────────────────────
help:
	@echo ""
	@echo "  Credit Card Fraud Detection — Available commands"
	@echo "  ─────────────────────────────────────────────────"
	@echo "  make install        Install all Python dependencies"
	@echo "  make notebook       Launch Jupyter Notebook"
	@echo "  make run            Run the notebook non-interactively (CLI)"
	@echo "  make clean          Remove generated figures and cache files"
	@echo "  make docker-build   Build the Docker image"
	@echo "  make docker-run     Run the project inside Docker"
	@echo "  make lint           Check code style with flake8"
	@echo "  make test           Run unit tests"
	@echo ""

# ── Setup ───────────────────────────────────────────────────────
install:
	@echo ">>> Installing dependencies..."
	pip install --upgrade pip
	pip install -r requirements.txt
	@echo ">>> Done."

# ── Run notebook interactively ───────────────────────────────────
notebook:
	@echo ">>> Starting Jupyter Notebook..."
	jupyter notebook notebooks/credit_fraud.ipynb

# ── Execute notebook end-to-end from command line ────────────────
run:
	@echo ">>> Running notebook non-interactively..."
	jupyter nbconvert \
		--to notebook \
		--execute \
		--inplace \
		notebooks/credit_fraud.ipynb
	@echo ">>> Notebook executed. Figures saved to reports/figures/"

# ── Clean generated files ────────────────────────────────────────
clean:
	@echo ">>> Cleaning generated files..."
	find . -type f -name "*.pyc" -delete
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name ".ipynb_checkpoints" -exec rm -rf {} + 2>/dev/null || true
	rm -f reports/figures/*.png
	@echo ">>> Clean complete."

# ── Docker ───────────────────────────────────────────────────────
docker-build:
	@echo ">>> Building Docker image..."
	docker build -t fraud-detection:latest .
	@echo ">>> Image built: fraud-detection:latest"

docker-run:
	@echo ">>> Running container on http://localhost:8888 ..."
	docker run --rm -p 8888:8888 \
		-v $(PWD)/data:/app/data \
		-v $(PWD)/reports:/app/reports \
		fraud-detection:latest

# ── Code quality ─────────────────────────────────────────────────
lint:
	@echo ">>> Running flake8..."
	pip install --quiet flake8
	flake8 src/ --max-line-length=100 --ignore=E402,W503

# ── Tests ────────────────────────────────────────────────────────
test:
	@echo ">>> Running tests..."
	pip install --quiet pytest
	pytest tests/ -v
