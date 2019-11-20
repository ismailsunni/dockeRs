build-dockeRs:
	@echo "Build FastR 3.4.0 on Debian with Geospatial packages Docker image."
	docker build -t ismailsunni/fastr-3.4.0-debian-geospatial . | tee log_$(shell date --iso=seconds).txt 

run-dockeRs:
	@echo "Run FastR 3.4.0 on Debian with Geospatial packages Docker image."
	docker run  -it --rm ismailsunni/fastr-3.4.0-debian-geospatial 

shell-dockeRs:
	@echo "Run FastR 3.4.0 on Debian with Geospatial packages Docker image."
	docker run -it --rm ismailsunni/fastr-3.4.0-debian-geospatial /bin/bash

pull-dockeRs:
	@echo "Pull FastR 3.4.0 on Debian with Geospatial packages Docker image."
	docker pull ismailsunni/fastr-3.4.0-debian-geospatial

push-dockeRs:
	@echo "Push FastR 3.4.0 on Debian with Geospatial packages to Docker Hub."
	docker push ismailsunni/fastr-3.4.0-debian-geospatial

check-dockeRs:
	@echo "Check FastR 3.4.0 on Debian with Geospatial packages Docker image."
	docker run -it --rm ismailsunni/fastr-3.4.0-debian-geospatial Rscript check_packages.R

test-dockeRs:
	@echo "Run test/benchmark on the FastR 3.4.0 on Debian with Geospatial packages"
	@# all test files are in the ../test directory.
	docker run -it -v $(shell pwd)/../test:/home/docker/test --rm ismailsunni/fastr-3.4.0-debian-geospatial /bin/bash

