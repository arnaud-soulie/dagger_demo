// Ugly package to provide Kube abstraction to push on minikube cluster for demo purpose
// Specific commands in the end to solve pod starting issues


package kubernetes

import (
    "dagger.io/dagger"
    "universe.dagger.io/docker"
    )

#Kubectl: {
    version: string | *"3.15.0@sha256:21a3deaa0d32a8057914f36584b5288d2e5ecc984380bc0118285c70fa8c9300"
    kubeconfig: dagger.#FS
    manifest: dagger.#FS
    customimage: string
    ip: string
    namespace: string

    docker.#Build & {
        steps: [
            docker.#Pull & {
                source: "index.docker.io/alpine:\(version)"
            },
            docker.#Run & {
                //Wait for the build before deploying
                env: DEP: "\(customimage)"
                command: {
                    name: "apk"
                    args: [
                        "add",
                        "--no-cache",
                        "bash",
                        "curl",
                    ]
                }
            },
            docker.#Run & {
                command: {
                    name: "/bin/bash"
                    args: ["-c", "curl -sfL https://dl.k8s.io/v1.19.9/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl"]
                }
            },
            docker.#Copy & {
                contents: kubeconfig
                source:   "*"
                dest:     "/root/"
            },
            docker.#Copy & {
                contents: manifest
                source:   "*"
                dest:     "/root/manifest/"
            },
            docker.#Run & {
                always: true
                command: {
                    name: "/bin/bash"
                    args: ["-c", "sed -i 's/minikubeiptosed/\(ip)/g' /root/config && sed -i 's$myimagetosed$\(customimage)$g' /root/manifest/pacman-deployment.yaml"]
                }
            },
            docker.#Run & {
                always: true
                command: {
                    name: "/bin/bash"
                    args: ["-c", "KUBECONFIG=\"/root/config\" kubectl create namespace \"\(namespace)\"  > /dev/null 2>&1 || true"]
                }
            },
            docker.#Run & {
                always: true
                command: {
                    name: "/bin/bash"
                    args: ["-c", "KUBECONFIG=\"/root/config\" kubectl --namespace \"\(namespace)\" apply -R -f /root/manifest/"]
                }
            },
            docker.#Run & {
                always: true
                command: {
                    name: "/bin/bash"
                    args: ["-c", "KUBECONFIG=\"/root/config\" kubectl wait --for=condition=ready pod -l name=mongo -n daggerdemo"]
                }
            },
            docker.#Run & {
                always: true
                command: {
                    name: "/bin/bash"
                    args: ["-c", "KUBECONFIG=\"/root/config\" kubectl delete po -l name=pacman -n daggerdemo"]
                }
            },
        ]
    }
}
