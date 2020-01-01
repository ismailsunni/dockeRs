# FastR 3.6.1 on Oracle Linux Server with Geospatial packages

You can build it manually using this command from the current directory:

`make build-dockeRs`

Or pull from docker hub

`make pull-dockeRs`

Or run R from the docker image

`make run-dockeRs`

Or run package completeness

`make check-dockeRs`

## Uninstalled packages

### Spatial Packages

TBA

### Spatiotemporal Packages

TBA

### Problems

Since it uses Oracle Linux base image, it has outdated libraries/dependencies.  For example, I need to install GDAL from scratch. When I test with SDSR book, I need Pandoc version 1.17.2 (at least). And it is not easy to install it in Oracle Linux. Here is a rant about installing Pandoc on CentOS (similar to Oracle Linux).

Full error message

```bash
Cannot open data source /opt/graalvm-ce-java8-19.3.0/jre/languages/R/library/sf/gpkg/nc.gpkg
Quitting from lines 140-147 (sds.Rmd) 
Error in CPL_read_ogr(dsn, layer, query, as.character(options), quiet,  :
  Open failed.

In addition: Warning message:
In verify_rstudio_version() :
  Please install or upgrade Pandoc to at least version 1.17.2; or if you are using RStudio, you can just install RStudio 1.0+.
Error in CPL_read_ogr(dsn, layer, query, as.character(options), quiet,  :
  Open failed.

In addition: Warning message:
In verify_rstudio_version() :
  Please install or upgrade Pandoc to at least version 1.17.2; or if you are using RStudio, you can just install RStudio 1.0+.
Error in CPL_read_ogr(dsn, layer, query, as.character(options), quiet,  :
  Open failed.

In addition: Warning message:
In verify_rstudio_version() :
  Please install or upgrade Pandoc to at least version 1.17.2; or if you are using RStudio, you can just install RStudio 1.0+.
Error in CPL_read_ogr(dsn, layer, query, as.character(options), quiet,  :
  Open failed.

In addition: Warning message:
In verify_rstudio_version() :
  Please install or upgrade Pandoc to at least version 1.17.2; or if you are using RStudio, you can just install RStudio 1.0+.
Error in CPL_read_ogr(dsn, layer, query, as.character(options), quiet,  :
  Open failed.

In addition: Warning message:
In verify_rstudio_version() :
  Please install or upgrade Pandoc to at least version 1.17.2; or if you are using RStudio, you can just install RStudio 1.0+.

Error in CPL_read_ogr(dsn, layer, query, as.character(options), quiet,  :
  Open failed.

In addition: Warning message:
In verify_rstudio_version() :
  Please install or upgrade Pandoc to at least version 1.17.2; or if you are using RStudio, you can just install RStudio 1.0+.
Error in CPL_read_ogr(dsn, layer, query, as.character(options), quiet,  :
  Open failed.

In addition: Warning message:
In verify_rstudio_version() :
  Please install or upgrade Pandoc to at least version 1.17.2; or if you are using RStudio, you can just install RStudio 1.0+.
Error in CPL_read_ogr(dsn, layer, query, as.character(options), quiet,  :
  Open failed.

In addition: Warning message:
In verify_rstudio_version() :
  Please install or upgrade Pandoc to at least version 1.17.2; or if you are using RStudio, you can just install RStudio 1.0+.
```
