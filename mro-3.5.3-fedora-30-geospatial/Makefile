build-dockeRs:
	@echo "Build MRO 3.5.3 on Fedora 30 with Geospatial packages Docker image."
	docker build -t ismailsunni/mro-3.5.3-fedora-30-geospatial . | tee log_$(shell date --iso=seconds).txt 

run-dockeRs:
	@echo "Run MRO 3.5.3 on Fedora 30 with Geospatial packages Docker image."
	docker run  -it --rm ismailsunni/mro-3.5.3-fedora-30-geospatial R

shell-dockeRs:
	@echo "Run MRO 3.5.3 on Fedora 30 with Geospatial packages Docker image."
	docker run -it --rm ismailsunni/mro-3.5.3-fedora-30-geospatial /bin/bash

pull-dockeRs:
	@echo "Pull MRO 3.5.3 on Fedora 30 with Geospatial packages Docker image."
	docker pull ismailsunni/mro-3.5.3-fedora-30-geospatial

push-dockeRs:
	@echo "Push MRO 3.5.3 on Fedora 30 with Geospatial packages to Docker Hub."
	docker push ismailsunni/mro-3.5.3-fedora-30-geospatial

check-dockeRs:
	@echo "Check MRO 3.5.3 on Fedora 30 with Geospatial packages Docker image."
	docker run -it --rm ismailsunni/mro-3.5.3-fedora-30-geospatial Rscript check_packages.R

check-core-dockeRs:
	@echo "Check MRO 3.5.3 on Fedora 30 with Geospatial core packages Docker image."
	docker run -it --rm ismailsunni/mro-3.5.3-fedora-30-geospatial Rscript check_core_packages.R

bookdown-dockeRs:
	@echo "Compile SDSR book with MRO 3.5.3 on Fedora 30 with Geospatial Docker image."
	docker run -it --rm -v /home/ismailsunni/dev/r/sdsr:/home/docker/sdsr ismailsunni/mro-3.5.3-fedora-30-geospatial /bin/bash

test-dockeRs:
	@echo "Run test/benchmark on the MRO 3.5.3 on Fedora 30 with Geospatial packages"
	@# all test files are in the ../test directory.
	docker run -it -v $(shell pwd)/../test:/home/docker/test --rm ismailsunni/mro-3.5.3-fedora-30-geospatial /bin/bash
