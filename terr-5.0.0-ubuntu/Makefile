build-dockeRs:
	@echo "Build TERR 5.0.0 on Ubuntu Docker image."
	docker build -t ismailsunni/terr-5.0.0-ubuntu . | tee log_$(shell date --iso=seconds).txt 

run-dockeRs:
	@echo "Run TERR 5.0.0 on Ubuntu Docker image."
	docker run  -it --rm ismailsunni/terr-5.0.0-ubuntu

shell-dockeRs:
	@echo "Run TERR 5.0.0 on Ubuntu Docker image."
	docker run -it --rm ismailsunni/terr-5.0.0-ubuntu /bin/bash

pull-dockeRs:
	@echo "Pull TERR 5.0.0 on Ubuntu Docker image."
	docker pull ismailsunni/terr-5.0.0-ubuntu

push-dockeRs:
	@echo "Push TERR 5.0.0 on Ubuntu to Docker Hub."
	docker push ismailsunni/terr-5.0.0-ubuntu

check-dockeRs:
	@echo "Check TERR 5.0.0 on Ubuntu Docker image."
	docker run -it --rm ismailsunni/terr-5.0.0-ubuntu Rscript check_packages.R

test-dockeRs:
	@echo "Run test/benchmark on the TERR 5.0.0 on Ubuntu with Geospatial packages"
	@# all test files are in the ../test directory.
	docker run -it -v $(shell pwd)/../test:/home/docker/test --rm ismailsunni/terr-5.0.0-ubuntu /bin/bash
