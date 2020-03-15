# dockeRs

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3671417.svg)](https://doi.org/10.5281/zenodo.3671417)

A collection of docker image of various R implementations on various platform both vanilla and with geospatial R packages.

This is part of my [master thesis](https://github.com/ismailsunni/MasterThesis).

## Docker Images

### Vanilla R (18/18)

|            |    GNU-R   |     MRO    |   Renjin   |    FastR   |     pqR    |    TERR    |
|------------|:----------:|:----------:|:----------:|:----------:|:----------:|:----------:|
| Debian     | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
| Fedora     | :heavy_check_mark: | :heavy_check_mark: | :no_entry: | :heavy_check_mark: | :no_entry: | :no_entry: |
| Arch Linux | :heavy_check_mark: | :heavy_check_mark: | :no_entry: | :no_entry: | :no_entry: | :no_entry: |

### with Geospatial R Packages (18/18)

|            |    GNU-R   |     MRO    |   Renjin   |    FastR   |     pqR    |    TERR    |
|------------|:----------:|:----------:|:----------:|:----------:|:----------:|:----------:|
| Debian     | :heavy_check_mark: | :heavy_check_mark: | :x: | :x: | :x: | :x: |
| Fedora     | :heavy_check_mark: | :heavy_check_mark: | :x: | :x: | :x: | :x: |
| Arch Linux | :heavy_check_mark: | :question: | :x: | :x: | :x: | :x: |

Legends:

- :heavy_check_mark: : Complete
- :x: : Not possible
- :no_entry: : Won't be checked because it is not supported based on other result
- :question: : Unknown due to time limit
- :grey_question: : Unknown / Not checked yet

### SDSR's benchmark status

For more detailed result can be read in my [master thesis](https://github.com/ismailsunni/MasterThesis).

## Content

Each docker image directory contains:

1. (mandatory) README.MD: description of the docker image and how to obtain it
2. Dockerfile : the dockerfile, if not available on other source
3. (mandatory) Makefile : Some handy command to run the docker container
4. Error.txt : error message if not possible to create, or related to it

## Naming

The format is : [R-implementation]-[version]-[platform]-[geospatial].
