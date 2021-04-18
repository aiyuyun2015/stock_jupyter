docker build -t python_image -f Dockerfile .
docker run -it -p 7777:7777 -v "$PWD"/src:/home/demo/src python_image
