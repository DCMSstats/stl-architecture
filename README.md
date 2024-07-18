# Short Term Lets Architecture

This repository holds information for the development of the Architecture for the Short Term Lets Registry, including architecture diagrams, architectural decision records and other information.

We like to [Visualise Architecture](https://github.com/madetech/architecture-handbook/blob/main/learning_paths/visualising_architecture.md). C4 Model and Structurizr are one way to achieving this.

## Local Interactive Server

To view the site and edit the site locally you can use [Structurizr Lite](https://structurizr.com/share/76352/documentation) by:

```
git clone git@github.com:DCMSstats/stl-architecture.git
cd stl-architecture
docker pull structurizr/lite
docker run -it --rm -p 8080:8080 -v $PWD:/usr/local/structurizr structurizr/lite
```

Open your browser and go to `localhost:8080`.

This will allow you to use Structurizr website locally.

