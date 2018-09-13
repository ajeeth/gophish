# gophish
Docker for Gophish

## Description

A quick docker deploy for [gophish](https://github.com/gophish/gophish).

Docker uses Ubuntu Bionic

## Usage

#### Quickstart

```bash
docker run -ti --name gophish -p 3333:3333 -p 80:80 ajeeth/gophish
```
To run as a daemon:

```bash
docker run -d --name gophish -p 3333:3333 -p 80:80 ajeeth/gophish
```

Admin interdace is at ```https://<Docker host IP>:3333```
