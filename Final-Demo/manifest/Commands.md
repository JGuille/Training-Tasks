Kubectl Commands

### Commands order

Configuring cluster access for kubectl
- cloud container clusters get-credentials epam-cluster --zone=us-central1-b

Deploy Ghost
- kubectl apply -f ghost.yaml
Replace your IP in ghost-svc.yaml
- kubectl apply -f ghost-svc.yaml

Create secrets
Replace this values in the secret.yaml
- echo -n 'connectionNamefrominstance' | base64
- echo dbuser | base64
- echo dbpasword | base64
- kubectl apply -f secret.yaml
Replace your_file with the name of your service account
- kubectl create secret generic sql-credentials --from-file=credentials.json=your_file.json

Deploy Cloud SQL Proxy
- kubectl apply -f cloudsql_proxy.yaml
- kubectl apply -f cloudsql_svc.yaml

Deploy Cronjob

Create secret for pulling images
- kubectl create secret docker-registry gcr-json-key \
--docker-server=gcr.io \
--docker-username=_json_key \
--docker-password="$(cat final-demo.json)" \
--docker-email=any@valid.email

Patch service account
- kubectl patch serviceaccount default \
-p '{"imagePullSecrets": [{"name": "gcr-json-key"}]}'

- kubectl apply -f cloud_cronjob.yaml