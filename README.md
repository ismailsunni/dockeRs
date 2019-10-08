# dockeRs

A collection of docker image of various R implementations on various platform both vanilla and with geospatial R packages.

This is part of my master thesis.

## Docker Images

### Vanilla R

|            |    GNU-R   |     MRO    |   Renjin   |    FastR   |     pqR    |    TERR    |
|------------|:----------:|:----------:|:----------:|:----------:|:----------:|:----------:|
| Debian    | :question: | :question: | :question: | :question: | :question: | :question: |
| Fedora     | :question: | :question: | :question: | :question: | :question: | :question: |
| Arch Linux | :question: | :question: | :question: | :question: | :question: | :question: |

### with Geospatial R Packages

|            |    GNU-R   |     MRO    |   Renjin   |    FastR   |     pqR    |    TERR    |
|------------|:----------:|:----------:|:----------:|:----------:|:----------:|:----------:|
| Debian     | :question: | :heavy_check_mark: | :question: | :question: | :question: | :question: |
| Fedora     | :question: | :question: | :question: | :question: | :question: | :question: |
| Arch Linux | :question: | :question: | :question: | :question: | :question: | :question: |

Legends:

- :heavy_check_mark: : Complete
- :heavy_multiplication_x: : Not complete
- :question: : Unknown / Not tested yet

## Content

Each docker image directory contains:

1. (mandatory) README.MD: description of the docker image and how to obtain it
2. Dockerfile : the docckerfile, if not available on other source
3. Error.txt : error message if not possible to create, or related to it

## Naming

The format is : [R-implementation]-[R-version]-[platform]-[geospatial].
