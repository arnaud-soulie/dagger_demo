//cue export 3-generate.cue --out yaml

package gen

#Service: {
  apiVersion: "v1"
  kind: "Service"
  metadata: {
    name: string
    }
  spec: {
    selector: {
      app: string
      }
    ports: [{
    port: 80
    targetPort: 80
    }]
  }
}

_names: ["app1", "app2"]

[ for n in _names {#Service & {
    metadata: name: "\(n)-service"
    spec: selector: app: n}}]



