build-dockeRs:
	@echo "Build FastR 3.6.1 on Fedora Docker image."
	docker build -t ismailsunni/fastr-3.6.1-fedora . | tee log_$(shell date --iso=seconds).txt 

run-dockeRs:
	@echo "Run FastR 3.6.1 on Fedora Docker image."
	docker run  -it --rm ismailsunni/fastr-3.6.1-fedora R

shell-dockeRs:
	@echo "Run FastR 3.6.1 on Fedora Docker image."
	docker run -it --rm ismailsunni/fastr-3.6.1-fedora /bin/bash

pull-dockeRs:
	@echo "Pull FastR 3.6.1 on Fedora Docker image."
	docker pull ismailsunni/fastr-3.6.1-fedora

push-dockeRs:
	@echo "Push FastR 3.6.1 on Fedora to Docker Hub."
	docker push ismailsunni/fastr-3.6.1-fedora

check-dockeRs:
	@echo "Check FastR 3.6.1 on Fedora Docker image."
	docker run -it --rm ismailsunni/fastr-3.6.1-fedora Rscript check_packages.R

test-dockeRs:
	@echo "Run test/benchmark on the FastR 3.6.1 on Fedora with Geospatial packages"
	@# all test files are in the ../test directory.
	docker run -it -v $(shell pwd)/../test:/home/docker/test --rm ismailsunni/fastr-3.6.1-fedora /bin/bash
