build-dockeRs:
	@echo "Build MRO 3.5.3 on Fedora with Geospatial packages Docker image."
	docker build -t ismailsunni/mro-3.5.3-fedora-geospatial . | tee log_$(shell date --iso=seconds).txt 

run-dockeRs:
	@echo "Run MRO 3.5.3 on Fedora with Geospatial packages Docker image."
	docker run  -it --rm ismailsunni/mro-3.5.3-fedora-geospatial R

shell-dockeRs:
	@echo "Run MRO 3.5.3 on Fedora with Geospatial packages Docker image."
	docker run -it --rm ismailsunni/mro-3.5.3-fedora-geospatial /bin/bash

pull-dockeRs:
	@echo "Pull MRO 3.5.3 on Fedora with Geospatial packages Docker image."
	docker pull ismailsunni/mro-3.5.3-fedora-geospatial

push-dockeRs:
	@echo "Push MRO 3.5.3 on Fedora with Geospatial packages to Docker Hub."
	docker push ismailsunni/mro-3.5.3-fedora-geospatial

check-dockeRs:
	@echo "Check MRO 3.5.3 on Fedora with Geospatial packages Docker image."
	docker run -it --rm ismailsunni/mro-3.5.3-fedora-geospatial Rscript check_packages.R

check-core-dockeRs:
	@echo "Check MRO 3.5.3 on Fedora with Geospatial core packages Docker image."
	docker run -it --rm ismailsunni/mro-3.5.3-fedora-geospatial Rscript check_core_packages.R

test-dockeRs:
	@echo "Run test/benchmark on the MRO 3.5.3 on Fedora with Geospatial packages"
	@# all test files are in the ../test directory.
	docker run -it -v $(shell pwd)/../test:/home/docker/test --rm ismailsunni/mro-3.5.3-fedora-geospatial /bin/bash
