graal=/root/.sdkman/candidates/java/23-graalce

build:
	bal build

run:
	bal run

#Uses info from the Ballerina.toml file?
buildjar:
	GRAALVM_HOME=$(graal) bal build --graalvm
	mv target/bin/cli.jar ./cli.jar

#Uses info from the Cloud.toml file
builddocker:
	bal build --cloud="docker"
	docker save --output franceme_demo.tar franceme/hello:v0.0.0
#Load via docker load --input <franceme_demo.tar>