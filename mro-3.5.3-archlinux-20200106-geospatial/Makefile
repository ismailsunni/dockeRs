build-dockeRs:
	@echo "Build MRO 3.5.3 on Arch Linux 20200106 with Geospatial packages Docker image."
	docker build -t ismailsunni/mro-3.5.3-archlinux-geospatial:20200106 . | tee log_$(shell date --iso=seconds).txt 

run-dockeRs:
	@echo "Run MRO 3.5.3 on Arch Linux 20200106  with Geospatial packages Docker image."
	docker run  -it --rm ismailsunni/mro-3.5.3-archlinux-geospatial:20200106

shell-dockeRs:
	@echo "Run MRO 3.5.3 on Arch Linux 20200106  with Geospatial packages Docker image."
	docker run -it --rm ismailsunni/mro-3.5.3-archlinux-geospatial:20200106 /bin/bash

pull-dockeRs:
	@echo "Pull MRO 3.5.3 on Arch Linux 20200106  with Geospatial packages Docker image."
	docker pull ismailsunni/mro-3.5.3-archlinux-geospatial:20200106

push-dockeRs:
	@echo "Push MRO 3.5.3 on Arch Linux 20200106 with Geospatial packages to Docker Hub."
	docker push ismailsunni/mro-3.5.3-archlinux-geospatial:20200106

bookdown-dockeRs:
	@echo "Compile SDSR book with MRO 3.5.3 on Arch Linux 20200106 with Geospatial packages Docker image."
	docker run -it --rm -v /home/ismailsunni/dev/r/sdsr:/home/docker/sdsr ismailsunni/mro-3.5.3-archlinux-geospatial:20200106 /bin/bash

check-dockeRs:
	@echo "Check MRO 3.5.3 on Arch Linux with Geospatial packages Docker image."
	docker run -it --rm ismailsunni/mro-3.5.3-archlinux-geospatial:20200106 Rscript check_packages.R

check-core-dockeRs:
	@echo "Check MRO 3.5.3 on Arch Linux with Geospatial packages Docker image."
	docker run -it --rm ismailsunni/mro-3.5.3-archlinux-geospatial:20200106 Rscript check_core_packages.R

test-dockeRs:
	@echo "Run test/benchmark on the MRO 3.5.3 on Arch Linux with Geospatial packages"
	@# all test files are in the ../test directory.
	docker run -it -v $(shell pwd)/../test:/home/docker/test --rm ismailsunni/mro-3.5.3-archlinux-geospatial:20200106 /bin/bash
