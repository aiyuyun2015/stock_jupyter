docker build -t python_image -f Dockerfile .
python3 -m venv env
source env/bin/activate
pip install dvc[all]


