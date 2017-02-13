DOCKER=$(shell which docker)
FAKE2DB=env/bin/fake2db
docker_image=mysql:5.6
db_name=apps
n_rows=100
password=
host=127.0.0.1

up/mysql:
	$(DOCKER) run -it \
		-v $(PWD)/sqls:/docker-entrypoint-initdb.d \
		-e MYSQL_ROOT_PASSWORD=$(password) \
		-e MYSQL_DATABASE=$(db_name) \
		-p 3306:3306 \
		$(docker_image) 

run: $(FAKE2DB)
	$< --rows $(n_rows) \
		--db mysql \
		--name $(db_name) \
		--port 3306 \
		--host $(host) \
		--username root \
		--password $(password)

env/bin/fake2db:
	$(MAKE) install

install:env/bin/pip
	$< install -r requirements.txt

env/bin/pip:
	$(MAKE) virtualenv

virtualenv:
	virtualenv -p python2 env

clean:
	rm -rf env
