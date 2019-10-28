build-dockeRs:
	@echo "Build GNU-R 3.6.1 on Debian with Geospatial packages Docker image."
	docker build -t ismailsunni/gnur-3.6.1-debian-geospatial .

run-dockeRs:
	@echo "Run GNU-R 3.6.1 on Debian with Geospatial packages Docker image."
	docker run -it --rm ismailsunni/gnur-3.6.1-debian-geospatial R

shell-dockeRs:
	@echo "Run GNU-R 3.6.1 on Debian with Geospatial packages Docker image."
	docker run -it --rm ismailsunni/gnur-3.6.1-debian-geospatial /bin/bash

pull-dockeRs:
	@echo "Pull GNU-R 3.6.1 on Debian with Geospatial packages Docker image."
	docker pull ismailsunni/gnur-3.6.1-debian-geospatial

check-dockeRs:
	@echo "Check GNU-R 3.6.1 on Debian with Geospatial packages Docker image."
	docker run -it --rm ismailsunni/gnur-3.6.1-debian-geospatial Rscript check_packages.R
