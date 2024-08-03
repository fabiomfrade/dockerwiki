# DockerWiki
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white) ![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white) ![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)
## Objetivo

Esse repositório é utilizado para a construção de imagem docker através de arquivo Dockerfile.

Esta imagem é construída em cima do _Alpine Linux Latest Version_ e com versão do _PHP_ 8; Também utiliza _NGINX_ e sempre irá fazer o download da última versão disponível (Latest) do projeto Dokuwiki em seu repositório oficial.

Foi criado um script de inicialização cujo objetivo é verificar se o diretório mapeado para a pasta __dokuwiki__ está vazio ou não; Caso o diretório esteja vazio, o script irá copiar os arquivos base da dokuwiki previamente baixada, para o volume mapeado.

com este script, a imagem te dá autonomia para utilizar uma instalação limpa da Wiki ou restaurar um backup previamente existente.

# Utilização
Recomendo utilizar a imagem previamente buildada disponível no [Docker Hub](https://hub.docker.com/r/fabiomfrade/dockerwiki)

```console
docker pull fabiomfrade/dockerwiki
```
Para montar o container, utilize a sintaxe a seguir:

```console
docker run -d -p <porta>:80 --restart unless-stopped --name <nome_desejado> -v <volume ou diretório a ser mapeado>:/dokuwiki fabiomfrade/dockerwiki:latest
```


Se você quiser fazer o build da imagem usando versões diferentes dos pacotes citados anteriormente, fique a vontade para fazer um clone deste repositório

```console
git clone https://github.com/fabiomfrade/dockerwiki.git
```

# DockerWiki
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white) ![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white) ![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)

## Purpose

This repository is used for building a Docker image through a Dockerfile.

This image is built on top of _Alpine Linux Latest Version_ and uses _PHP_ version 8. It also incorporates NGINX and will always download the latest version available (Latest) of the Dokuwiki project from its official repository.

An initialization script has been created with the goal of checking whether the mapped directory to the dokuwiki folder is empty or not. If the directory is empty, the script will copy the base files of the previously downloaded Dokuwiki to the mapped volume.

With this script, the image provides autonomy to use a clean installation of the Wiki or restore a previously existing backup.

Usage

I recommend using the pre-built image available on [Docker Hub](https://hub.docker.com/r/fabiomfrade/dockerwiki)

```console
docker pull fabiomfrade/dockerwiki
```
To run the container, use the following syntax:

```console
docker run -d -p <port>:80 --restart unless-stopped --name <desired_name> -v <volume or directory to be mapped>:/dokuwiki fabiomfrade/dockerwiki:latest
```

If you want to build the image using different versions of the mentioned packages, feel free to clone this repository.

```console
git clone https://github.com/fabiomfrade/dockerwiki.git
```