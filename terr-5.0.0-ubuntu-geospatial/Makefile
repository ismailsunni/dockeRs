build-dockeRs:
	@echo "Build TERR 5.0.0 on Ubuntu with Geospatial Packages Docker image."
	docker build -t ismailsunni/terr-5.0.0-ubuntu-geospatial . | tee log_$(shell date --iso=seconds).txt 

run-dockeRs:
	@echo "Run TERR 5.0.0 on Ubuntu with Geospatial Packages Docker image."
	docker run  -it --rm ismailsunni/terr-5.0.0-ubuntu-geospatial

shell-dockeRs:
	@echo "Run TERR 5.0.0 on Ubuntu with Geospatial Packages Docker image."
	docker run -it --rm ismailsunni/terr-5.0.0-ubuntu-geospatial /bin/bash

pull-dockeRs:
	@echo "Pull TERR 5.0.0 on Ubuntu with Geospatial Packages Docker image."
	docker pull ismailsunni/terr-5.0.0-ubuntu-geospatial

push-dockeRs:
	@echo "Push TERR 5.0.0 on Ubuntu to Docker Hub."
	docker push ismailsunni/terr-5.0.0-ubuntu-geospatial

check-dockeRs:
	@echo "Check TERR 5.0.0 on Ubuntu with Geospatial Packages Docker image."
	docker run -it --rm ismailsunni/terr-5.0.0-ubuntu-geospatial Rscript check_packages.R

check-core-dockeRs:
	@echo "Check TERR 5.0.0 on Ubuntu with Geospatial Packages Docker image."
	docker run -it --rm ismailsunni/terr-5.0.0-ubuntu-geospatial Rscript check_core_packages.R

bookdown-dockeRs:
	@echo "Compile SDSR book with TERR 5.0.0 on Ubuntu with Geospatial Packages Docker image."
	docker run -it --rm -v /home/ismailsunni/dev/r/sdsr:/home/docker/sdsr ismailsunni/terr-5.0.0-ubuntu-geospatial /bin/bash

test-dockeRs:
	@echo "Run test/benchmark on the TERR 5.0.0 on Ubuntu with Geospatial packages"
	@# all test files are in the ../test directory.
	docker run -it -v $(shell pwd)/../test:/home/docker/test --rm ismailsunni/terr-5.0.0-ubuntu-geospatial /bin/bash
