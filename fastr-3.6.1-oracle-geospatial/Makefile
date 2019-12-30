build-dockeRs:
	@echo "Build FastR 3.6.1 on Oracle Linux Server with Geospatial packages Docker image."
	docker build -t ismailsunni/fastr-3.6.1-oracle-geospatial . | tee log_$(shell date --iso=seconds).txt 

run-dockeRs:
	@echo "Run FastR 3.6.1 on Oracle Linux Server with Geospatial packages Docker image."
	docker run  -it --rm ismailsunni/fastr-3.6.1-oracle-geospatial R

shell-dockeRs:
	@echo "Run FastR 3.6.1 on Oracle Linux Server with Geospatial packages Docker image."
	docker run -it --rm ismailsunni/fastr-3.6.1-oracle-geospatial /bin/bash

pull-dockeRs:
	@echo "Pull FastR 3.6.1 on Oracle Linux Server with Geospatial packages Docker image."
	docker pull ismailsunni/fastr-3.6.1-oracle-geospatial

push-dockeRs:
	@echo "Push FastR 3.6.1 on Oracle Linux Server with Geospatial packages to Docker Hub."
	docker push ismailsunni/fastr-3.6.1-oracle-geospatial

check-dockeRs:
	@echo "Check FastR 3.6.1 on Oracle Linux Server with Geospatial packages Docker image."
	docker run -it --rm ismailsunni/fastr-3.6.1-oracle-geospatial Rscript check_packages.R

check-core-dockeRs:
	@echo "Check FastR 3.6.1 on Oracle Linux Server with Geospatial packages Docker image for core packages."
	docker run -it --rm ismailsunni/fastr-3.6.1-oracle-geospatial Rscript check_core_packages.R

bookdown-dockeRs:
	@echo "Compile SDSR book with FastR 3.6.1 on Oracle Linux Server with Geospatial packages Docker image."
	docker run -it --rm -v /home/ismailsunni/dev/r/sdsr:/home/docker/sdsr ismailsunni/fastr-3.6.1-oracle-geospatial /bin/bash

test-dockeRs:
	@echo "Run test/benchmark on the FastR 3.6.1 on Oracle Linux Server with Geospatial packages"
	@# all test files are in the ../test directory.
	docker run -it -v $(shell pwd)/../test:/home/docker/test --rm ismailsunni/fastr-3.6.1-oracle-geospatial /bin/bash
