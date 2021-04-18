docker build -t python_image -f Dockerfile .
docker run -it -p 7777:7777 -v "$PWD":/home/demo python_image
python3 -m venv env
source env/bin/activate
pip install dvc[all]

