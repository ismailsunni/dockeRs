build-dockeRs:
	@echo "Build Renjin 0.9 on Debian with R Geospatial packages docker image"
	docker build -t ismailsunni/renjinn-0.9-debian-geospatial .

pull-dockeRs:
	@echo "Pull Renjin 0.9 on Debian with R Geospatial packages from Docker Hub."
	docker pull ismailsunni/renjinn-0.9-debian-geospatial

push-dockeRs:
	@echo "Push Renjin 0.9 on Debian with R Geospatial packages to Docker Hub."
	docker push ismailsunni/renjinn-0.9-debian-geospatial

run-dockeRs:
	@echo "Run Renjin 0.9 on Debian with R Geospatial packages"
	docker run -it --rm ismailsunni/renjinn-0.9-debian-geospatial

shell-dockeRs:
	@echo "Run Shell on Renjin 0.9 on Debian with R Geospatial packages"
	docker run -it --rm ismailsunni/renjinn-0.9-debian-geospatial /bin/bash

check-dockeRs:
	@echo "Check Renjin 0.9 on Debian with R Geospatial Docker image."
	docker run -it --rm ismailsunni/renjinn-0.9-debian-geospatial Rscript check_packages.R