package demo

import (
    "dagger.io/dagger"
    "universe.dagger.io/docker"
    "dagger.io/dagger/core"
)

dagger.#Plan & {
    client: filesystem: {"./prez": read: contents: dagger.#FS
    "prez/index.html": write: contents: actions.build._output.contents
    }
    actions: build: {
    _build: docker.#Build & {
        steps: [
            docker.#Pull & {
            source: "marpteam/marp-cli"
        },
        docker.#Copy & {
                contents: client.filesystem."./prez".read.contents
                dest:     "/home/marp/app/"
            },
            docker.#Run & {
                entrypoint: ["/bin/sh"]
                command: {
                    name: "-c"
                    args: ["node /home/marp/.cli/marp-cli.js /home/marp/app/main.md "]
                }
            },     
        ]
    }

	_output: core.#ReadFile & {
				input: _build.output.rootfs
				path:  "/home/marp/app/main.html"
			}
    }
}
