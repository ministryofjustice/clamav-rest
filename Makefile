run:
	docker run --name clamav -d -p 3310:3310 quay.io/ukhomeofficedigital/clamav:v1.2.1-rc1
	docker run --name clamav-rest -d -p 8080:8080 --link clamav:clamav-server lokori/clamav-rest clamav-server

clean:
	docker kill clamav-rest || true
	docker rm clamav-rest || true
	docker kill clamav || true
	docker rm clamav

ping:
	curl localhost:8080

test-pass:
	curl -F "name=blabla" -F "file=@./foo.txt" localhost:8080/scan

test-fail:
	curl -F "name=blabla" -F "file=@./eicar.txt" localhost:8080/scan
