# dockeRs

A collection of docker image of various R implementations on various platform both vanilla and with geospatial R packages.

This is part of my [master thesis](https://github.com/ismailsunni/MasterThesis).

## Docker Images

### Vanilla R (17/18)

|            |    GNU-R   |     MRO    |   Renjin   |    FastR   |     pqR    |    TERR    |
|------------|:----------:|:----------:|:----------:|:----------:|:----------:|:----------:|
| Debian     | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
| Fedora     | :heavy_check_mark: | :heavy_check_mark: | :no_entry: | :heavy_check_mark: | :no_entry: | :no_entry: |
| Arch Linux | :heavy_check_mark: | :x: | :no_entry: | :grey_question: | :no_entry: | :no_entry: |

### with Geospatial R Packages (14/18)

|            |    GNU-R   |     MRO    |   Renjin   |    FastR   |     pqR    |    TERR    |
|------------|:----------:|:----------:|:----------:|:----------:|:----------:|:----------:|
| Debian     | :heavy_check_mark: | :heavy_check_mark: | :x: | :grey_question: | :x: | :x: |
| Fedora     | :heavy_check_mark: | :grey_question: | :x: | :grey_question: | :x: | :x: |
| Arch Linux | :heavy_check_mark: | :x: | :x: | :grey_question: | :x: | :x: |

Legends:

- :heavy_check_mark: : Complete
- :x: : Not possible
- :no_entry: : Won't be checked because it is not supported based on other result
- :grey_question: : Unknown / Not checked yet

### SDSR's benchmark status

| OS | R | Benchmark Status | Notes | 
|:---------:|:--------:|:--------:|------|
| Debian | GNU R | Success | |
| Fedora | GNU R | Success | |
| Arch Linux | GNU R | Failed | [Error's message](./gnuR-3.6.1-archlinux-geospatial#sdsr-benchmark-problem)|
| Ubuntu | MRO | Success | |

## Content

Each docker image directory contains:

1. (mandatory) README.MD: description of the docker image and how to obtain it
2. Dockerfile : the dockerfile, if not available on other source
3. (mandatory) Makefile : Some handy command to run the docker container
4. Error.txt : error message if not possible to create, or related to it

## Naming

The format is : [R-implementation]-[version]-[platform]-[geospatial].
