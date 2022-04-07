//prereq: docker run -d -p 5555:5000 --name registry registry:2
//REGISTRY_TOKEN="_" REGISTRY_USER="_" REGISTRY_URL="localhost:5555" dagger do build -p ci.cue --log-format=plain --no-cache
//docker run -p 12345:5000 -d --rm --pull always --name demo2 localhost:5555/demo2:latest
//http://localhost:12345
//https://hub.docker.com/repository/docker/fgtech/demo2

package ci

import (
	"dagger.io/dagger"
	"universe.dagger.io/docker"
)

dagger.#Plan & {
	client: {
        filesystem: "./app": read: contents: dagger.#FS
        env: {
            REGISTRY_USER: string
            REGISTRY_TOKEN: dagger.#Secret
            REGISTRY_URL: string
        }
    }

	actions: {
        build: {
                _build: docker.#Build & {
                    steps: [
                        docker.#Dockerfile & {
                            source: client.filesystem."./app".read.contents
                        },
                        docker.#Run & {
                            command: {
                                name: "/bin/bash"
                                args: ["-c", "echo $(TZ=Europe/Paris date +%T)>buildtime.txt"]
                            }
                        },
                    ]
            }
            docker.#Push & {
                dest: "\(client.env.REGISTRY_URL)/demo2:latest"
                image: _build.output
			    auth: {
                    username: client.env.REGISTRY_USER
                    secret:   client.env.REGISTRY_TOKEN
                }
		    }
        }
    }
}
