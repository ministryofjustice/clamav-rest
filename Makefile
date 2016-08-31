run:
	docker run --name clamav -d -p 3310:3310 quay.io/ukhomeofficedigital/clamav:v1.2.0
	docker run -p 8080:8080 --link clamav:clamav-server -t lokori/clamav-rest clamav-server

clean:
	docker stop clamav-rest || true
	docker rm clamav-rest || true
	docker stop clamav || true
	docker rm clamav

ping:
	curl localhost:8080

test-pass:
	curl -F "name=blabla" -F "file=@./foo.txt" localhost:8080/scan

test-fail:
	curl -F "name=blabla" -F "file=@./eicar.txt" localhost:8080/scan
