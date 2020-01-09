build-dockeRs:
	@echo "Build MRO 3.5.3 on Fedora 30 Docker image."
	docker build -t ismailsunni/mro-3.5.3-fedora-30 . | tee log_$(shell date --iso=seconds).txt 

run-dockeRs:
	@echo "Run MRO 3.5.3 on Fedora 30 Docker image."
	docker run  -it --rm ismailsunni/mro-3.5.3-fedora-30 R

shell-dockeRs:
	@echo "Run MRO 3.5.3 on Fedora 30 Docker image."
	docker run -it --rm ismailsunni/mro-3.5.3-fedora-30 /bin/bash

pull-dockeRs:
	@echo "Pull MRO 3.5.3 on Fedora 30 Docker image."
	docker pull ismailsunni/mro-3.5.3-fedora-30

push-dockeRs:
	@echo "Push MRO 3.5.3 on Fedora 30 to Docker Hub."
	docker push ismailsunni/mro-3.5.3-fedora-30

check-dockeRs:
	@echo "Check MRO 3.5.3 on Fedora 30 Docker image."
	docker run -it --rm ismailsunni/mro-3.5.3-fedora-30 Rscript check_packages.R

test-dockeRs:
	@echo "Run test/benchmark on the MRO 3.5.3 on Fedora 30 with Geospatial packages"
	@# all test files are in the ../test directory.
	docker run -it -v $(shell pwd)/../test:/home/docker/test --rm ismailsunni/mro-3.5.3-fedora-30 /bin/bash
