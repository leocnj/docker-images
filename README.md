# docker-images
Dockerfiles for some multimodal toolkits

# Plaform
All images are currently configured for run on Ubuntu 16.04 only

[openSMILE](http://audeering.com/technology/opensmile)
---------
These files are automatically downloaded and extracted into the appropriate directories when creating the image: [openSMILE opensmile-2.3.0.tar.gz](http://audeering.com/download/1318/opensmile-2.3.0.tar.gz) and [OpenCV 2.4.13.3.zip](https://github.com/opencv/opencv/archive/2.4.13.3.zip).

To start, run `docker build -t opensmile --file opensmile.dockerfile .`

[OpenFace](https://github.com/TadasBaltrusaitis/OpenFace)
---------
This file will be downloaded and extracted during the docker build process: [OpenCV 3.1.0](https://github.com/Itseez/opencv/archive/3.1.0.zip).

To start, run `docker build -t openface-cambridge --file openface-cambridge.dockerfile .`