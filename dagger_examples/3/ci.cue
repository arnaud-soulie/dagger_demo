//prereq: REGISTRY_TOKEN ; ./kubeconfig/config file
//REGISTRY_URL="fgtech" REGISTRY_USER="asoulie" dagger do deploy -p ci.cue --log-format plain -l debug --no-cache


package ci

import (
	"dagger.io/dagger"
	"universe.dagger.io/docker"
    "triche.io:kubernetes"
    "strings"
)

dagger.#Plan & {
	client: {
        commands: {
            minikubeip: {
                name: "minikube"
                args: ["ip"]
            }
        }
        filesystem: {
            "./app": read: contents: dagger.#FS
            "./manifest": read: contents: dagger.#FS
            "./kubeconfig": read: contents: dagger.#FS
        }
        env: {
            REGISTRY_URL: string
            REGISTRY_USER: string
            REGISTRY_TOKEN: dagger.#Secret
        }
    }

	actions: {
        build: {
            _build: docker.#Build & {
                    steps: [
                        docker.#Dockerfile & {
                            source: client.filesystem."./app".read.contents
                        },
                    ]
            }
            _push: docker.#Push & {
                dest: "\(client.env.REGISTRY_URL)/daggerapp:latest"
                image: _build.output
                auth: {
                    username: client.env.REGISTRY_USER
                    secret:   client.env.REGISTRY_TOKEN
                }
		    }
        }

        deploy: {
            kube: kubernetes.#Kubectl & {
                customimage: strings.Trim(actions.build._push.result, "\n") //docker.io/fgtech/daggerapp:latest
                ip: strings.Trim(client.commands.minikubeip.stdout, "\n")
                kubeconfig: client.filesystem."./kubeconfig".read.contents
                manifest: client.filesystem."./manifest".read.contents
                namespace: "daggerdemo"
            }
        }
    }
}









