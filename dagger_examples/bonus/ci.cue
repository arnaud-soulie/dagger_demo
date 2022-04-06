package ci

import (
	"dagger.io/dagger"
	"universe.dagger.io/go"
	"universe.dagger.io/docker"
	"universe.dagger.io/alpine"
)

dagger.#Plan & {
	client: {
		filesystem: "./app": read: {
			contents: dagger.#FS
		}

		env: REGISTRY_URL: string
	}

	actions: {
		_code: client.filesystem."./app".read.contents

		// Build go project
		build: go.#Build & {
			source: _code
		}

		// Build docker image (depends on build)
		image: docker.#Build & {
			steps: [
				alpine.#Build,
				docker.#Copy & {
					contents: build.output
					dest:     "/root"
				},
				docker.#Copy & {
					contents: client.filesystem."./app".read.contents
					dest:     "/root"
				},
				docker.#Set & {
					config: cmd: ["/root/godemo"]
				},
			]
		}

		// Push image to registry
		push: {
			docker.#Push & {
				"image": image.output
				dest:    "\(client.env.REGISTRY_URL)/demogo:latest"
			}
		}
	}
}