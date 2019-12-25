build-dockeRs:
	@echo "Build GNU-R 3.6.1 on Arch Linux with Geospatial packages Docker image."
	docker build -t ismailsunni/gnur-3.6.1-archlinux-geospatial . | tee log_$(shell date --iso=seconds).txt 

run-dockeRs:
	@echo "Run GNU-R 3.6.1 on Arch Linux with Geospatial packages Docker image."
	docker run  -it --rm ismailsunni/gnur-3.6.1-archlinux-geospatial

shell-dockeRs:
	@echo "Run GNU-R 3.6.1 on Arch Linux with Geospatial packages Docker image."
	docker run -it --rm ismailsunni/gnur-3.6.1-archlinux-geospatial /bin/bash

pull-dockeRs:
	@echo "Pull GNU-R 3.6.1 on Arch Linux with Geospatial packages Docker image."
	docker pull ismailsunni/gnur-3.6.1-archlinux-geospatial

push-dockeRs:
	@echo "Push GNU-R 3.6.1 on Arch Linux with Geospatial packages to Docker Hub."
	docker push ismailsunni/gnur-3.6.1-archlinux-geospatial

check-dockeRs:
	@echo "Check GNU-R 3.6.1 on Arch Linux with Geospatial packages Docker image."
	docker run -it --rm ismailsunni/gnur-3.6.1-archlinux-geospatial Rscript check_packages.R

test-dockeRs:
	@echo "Run test/benchmark on the GNU-R 3.6.1 on Arch Linux with Geospatial packages"
	@# all test files are in the ../test directory.
	docker run -it -v $(shell pwd)/../test:/home/docker/test --rm ismailsunni/gnur-3.6.1-archlinux-geospatial /bin/bash
