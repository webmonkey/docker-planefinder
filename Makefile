build:
	docker build -t webmonkey/planefinder .

run:
	docker run -p 30053:30053 --network adsb-containers_adsb --rm -it webmonkey/planefinder bash

