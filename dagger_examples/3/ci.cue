//dagger do build -p ci.cue

package goexample

import (
	"dagger.io/dagger"
	"dagger.io/dagger/core"
	"universe.dagger.io/go"
	"universe.dagger.io/docker"
	"universe.dagger.io/alpine"
)

dagger.#Plan & {
	client: filesystem: {
        "./app1": read: contents: dagger.#FS
        "./app2": read: contents: dagger.#FS
    }

	actions: build: {
		_baseImage: alpine.#Build

		app1: {
			build: go.#Build & {
				source: client.filesystem."./app1".read.contents
			}

			exec: docker.#Run & {
				input: _baseImage.output
				command: {
					name: "/bin/sh"
					args: ["-c", "/bin/hello >> /output.txt"]
				}
				env: NAME: "App1"
				mounts: binary: {
					dest:     "/bin/hello"
					contents: build.output
					source:   "/test"
				}
			}

			verify: core.#ReadFile & {
				input: exec.output.rootfs
				path:  "/output.txt"
			} & {
				contents: "Hi App1!"
			}
		}

        app2: {
			build: go.#Build & {
				source: client.filesystem."./app2".read.contents
			}

			exec: docker.#Run & {
				input: _baseImage.output
				command: {
					name: "/bin/sh"
					args: ["-c", "/bin/hello >> /output.txt"]
				}
				env: NAME: "App2"
				mounts: binary: {
					dest:     "/bin/hello"
					contents: build.output
					source:   "/test"
				}
			}

			verify: core.#ReadFile & {
				input: exec.output.rootfs
				path:  "/output.txt"
			} & {
				contents: "Hi App2!"
			}
		}
	}
}