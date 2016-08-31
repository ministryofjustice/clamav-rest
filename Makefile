run:
	docker-compose up

stop:
	docker-compose stop

test:
	make ping
	make test-pass
	make test-fail

ping:
	curl localhost:8080

test-pass:
	curl -F "name=blabla" -F "file=@./foo.txt" localhost:8080/scan

test-fail:
	curl -F "name=blabla" -F "file=@./eicar.txt" localhost:8080/scan
