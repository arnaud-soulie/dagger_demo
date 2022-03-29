//https://github.com/cue-lang/cue/issues/98
//cue vet 2_deployment.yaml 2_manifest.cue -d "#Schema" 

//Labels constraints:
#labels: [string]: string

#metadata: {
	name: string
	labels: #labels
	annotations?: [string]: string
}

#requiredLabels: #labels & {
	type: string
	env: *"dev" | "stg"
}

#Schema: #Deployment | #Service

#Schema: {
    metadata: #metadata & {
		labels: #requiredLabels
	}
}

#Deployment: {
	apiVersion: "apps/v1"
	kind:       "Deployment"
    metadata: {
        labels: {
            type: string
            ...
        }
        ...
    }
    ...
	
}

#Service: {
	apiVersion: "v1"
	kind:       "Service"
	...
}
