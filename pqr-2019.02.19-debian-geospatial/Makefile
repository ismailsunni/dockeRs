build-dockeRs:
	@echo "Build pqR 2019-02-19 on Debian with Geospatial packages Docker image."
	docker build -t ismailsunni/pqr-2019-02-19-debian-geospatial . | tee log_$(shell date --iso=seconds).txt 

run-dockeRs:
	@echo "Run pqR 2019-02-19 on Debian with Geospatial packages Docker image."
	docker run  -it --rm ismailsunni/pqr-2019-02-19-debian-geospatial R

shell-dockeRs:
	@echo "Run pqR 2019-02-19 on Debian with Geospatial packages Docker image."
	docker run -it --rm ismailsunni/pqr-2019-02-19-debian-geospatial /bin/bash

pull-dockeRs:
	@echo "Pull pqR 2019-02-19 on Debian with Geospatial packages Docker image."
	docker pull ismailsunni/pqr-2019-02-19-debian-geospatial

push-dockeRs:
	@echo "Push pqR 2019-02-19 on Debian with Geospatial packages to Docker Hub."
	docker push ismailsunni/pqr-2019-02-19-debian-geospatial

check-dockeRs:
	@echo "Check pqR 2019-02-19 on Debian with Geospatial packages Docker image."
	docker run -it --rm ismailsunni/pqr-2019-02-19-debian-geospatial Rscript check_packages.R

test-dockeRs:
	@echo "Run test/benchmark on the pqR 2019-02-19 on Debian with Geospatial packages"
	@# all test files are in the ../test directory.
	docker run -it -v $(shell pwd)/../test:/home/docker/test --rm ismailsunni/pqr-2019-02-19-debian-geospatial /bin/bash
