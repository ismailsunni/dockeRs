build-dockeRs:
	@echo "Build TERR 5.0.0 on Debian with Geospatial Packages Docker image."
	docker build -t ismailsunni/terr-5.0.0-debian-geospatial . | tee log_$(shell date --iso=seconds).txt 

run-dockeRs:
	@echo "Run TERR 5.0.0 on Debian with Geospatial Packages Docker image."
	docker run  -it --rm ismailsunni/terr-5.0.0-debian-geospatial

shell-dockeRs:
	@echo "Run TERR 5.0.0 on Debian with Geospatial Packages Docker image."
	docker run -it --rm ismailsunni/terr-5.0.0-debian-geospatial /bin/bash

pull-dockeRs:
	@echo "Pull TERR 5.0.0 on Debian with Geospatial Packages Docker image."
	docker pull ismailsunni/terr-5.0.0-debian-geospatial

push-dockeRs:
	@echo "Push TERR 5.0.0 on Debian to Docker Hub."
	docker push ismailsunni/terr-5.0.0-debian-geospatial

check-dockeRs:
	@echo "Check TERR 5.0.0 on Debian with Geospatial Packages Docker image."
	docker run -it --rm ismailsunni/terr-5.0.0-debian-geospatial Rscript check_packages.R

test-dockeRs:
	@echo "Run test/benchmark on the TERR 5.0.0 on Debian with Geospatial packages"
	@# all test files are in the ../test directory.
	docker run -it -v $(shell pwd)/../test:/home/docker/test --rm ismailsunni/terr-5.0.0-debian-geospatial /bin/bash
