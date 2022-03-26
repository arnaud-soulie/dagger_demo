package demo

import (
	"dagger.io/dagger"
    "universe.dagger.io/docker"
)

dagger.#Plan & {
    client: filesystem: {"./prez": read: contents: dagger.#FS
    "gen/output.html": write: contents: actions.build._output.contents
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
                command: {
                    name: "/bin/sh"
                    args: ["-c", "/home/marp/.cli/docker-entrypoint /home/marp/app/main.md"]
                }
            },
            docker.#Run & {
				command: {
					name: "/bin/sh"
					args: ["-c", "ls -l /home/marp/app"]
				}
			},        
        ]
        }

	_output: dagger.#ReadFile & {
				input: _build.output.rootfs
				path:  "/home/marp/app/main.html"
			}
    }
}
