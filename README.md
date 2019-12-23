# dockeRs

A collection of docker image of various R implementations on various platform both vanilla and with geospatial R packages.

This is part of my [master thesis](https://github.com/ismailsunni/MasterThesis).

## Docker Images

### Vanilla R (12/18)

|            |    GNU-R   |     MRO    |   Renjin   |    FastR   |     pqR    |    TERR    |
|------------|:----------:|:----------:|:----------:|:----------:|:----------:|:----------:|
| Debian     | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
| Fedora     | :heavy_check_mark: | :grey_question: | :no_entry: | :grey_question: | :no_entry: | :grey_question: |
| Arch Linux | :heavy_check_mark: | :grey_question: | :no_entry: | :grey_question: | :no_entry: | :grey_question: |

### with Geospatial R Packages (9/18)

|            |    GNU-R   |     MRO    |   Renjin   |    FastR   |     pqR    |    TERR    |
|------------|:----------:|:----------:|:----------:|:----------:|:----------:|:----------:|
| Debian     | :heavy_check_mark: | :heavy_check_mark: | :x: | :grey_question: | :x: | :grey_question: |
| Fedora     | :heavy_check_mark: | :grey_question: | :x: | :grey_question: | :x: | :grey_question: |
| Arch Linux | :grey_question: | :grey_question: | :x: | :grey_question: | :x: | :grey_question: |

Legends:

- :heavy_check_mark: : Complete
- :x: : Not possible
- :no_entry: : Will not be check since it won't be useful (i.e. not able to install core geospatial pacakges.)
- :grey_question: : Unknown / Not checked yet

## Content

Each docker image directory contains:

1. (mandatory) README.MD: description of the docker image and how to obtain it
2. Dockerfile : the dockerfile, if not available on other source
3. (mandatory) Makefile : Some handy command to run the docker container
4. Error.txt : error message if not possible to create, or related to it

## Naming

The format is : [R-implementation]-[version]-[platform]-[geospatial].
