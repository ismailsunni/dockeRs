build-dockeRs:
	@echo "Build MRO 3.5.3 on Arch Linux Docker image."
	docker build -t ismailsunni/mro-3.5.3-archlinux:20200106 . | tee log_$(shell date --iso=seconds).txt 

run-dockeRs:
	@echo "Run MRO 3.5.3 on Arch Linux Docker image."
	docker run  -it --rm ismailsunni/mro-3.5.3-archlinux:20200106 R --no-save

shell-dockeRs:
	@echo "Run MRO 3.5.3 on Arch Linux Docker image."
	docker run -it --rm ismailsunni/mro-3.5.3-archlinux:20200106 /bin/bash

pull-dockeRs:
	@echo "Pull MRO 3.5.3 on Arch Linux Docker image."
	docker pull ismailsunni/mro-3.5.3-archlinux:20200106

push-dockeRs:
	@echo "Push MRO 3.5.3 on Arch Linux to Docker Hub."
	docker push ismailsunni/mro-3.5.3-archlinux:20200106

check-dockeRs:
	@echo "Check MRO 3.5.3 on Arch Linux Docker image."
	docker run -it --rm ismailsunni/mro-3.5.3-archlinux:20200106 Rscript check_packages.R

test-dockeRs:
	@echo "Run test/benchmark on the MRO 3.5.3 on Arch Linux with Geospatial packages"
	@# all test files are in the ../test directory.
	docker run -it -v $(shell pwd)/../test:/home/docker/test --rm ismailsunni/mro-3.5.3-archlinux:20200106 /bin/bash
