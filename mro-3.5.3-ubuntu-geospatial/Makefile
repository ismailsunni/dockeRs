build-dockeRs:
	@echo "Build MRO 3.5.3 on Ubuntu with R Geospatial packages docker image"
	docker build -t ismailsunni/mro-3.5.3-ubuntu-geospatial .

pull-dockeRs:
	@echo "Pull MRO 3.5.3 on Ubuntu with R Geospatial packages from Docker Hub."
	docker pull ismailsunni/mro-3.5.3-ubuntu-geospatial

push-dockeRs:
	@echo "Push MRO 3.5.3 on Ubuntu with R Geospatial packages to Docker Hub."
	docker push ismailsunni/mro-3.5.3-ubuntu-geospatial

run-dockeRs:
	@echo "Run MRO 3.5.3 on Ubuntu with R Geospatial packages"
	docker run -it --rm ismailsunni/mro-3.5.3-ubuntu-geospatial

shell-dockeRs:
	@echo "Run Shell on MRO 3.5.3 on Ubuntu with R Geospatial packages"
	docker run -it --rm ismailsunni/mro-3.5.3-ubuntu-geospatial /bin/bash

check-dockeRs:
	@echo "Check MRO 3.5.3 on Ubuntu with R Geospatial packages Docker image."
	docker run -it --rm ismailsunni/mro-3.5.3-ubuntu-geospatial Rscript check_packages.R