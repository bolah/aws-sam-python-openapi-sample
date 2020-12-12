# Hello SAM+Lambda+Python+Openapi 3.0 project
SAM+lambda(Python) example with Openapi 3.0 yaml specification 


## Requirements

- SAM installed
- aws cli installed
- Python 3.7
- Make sure that your credentials are valid(use 'aws configure' command)
- make sure you have a bucket where artifacts can be uploaded and modify deploy.sh accordingly

## Installation & Usage
### pip install

Invoke locally 
```sh
./invoke_locally.sh
```

Start locally 
```sh
./start_locally.sh
```

Deploy to AWS
Make sure that you have an S3 bucket where artifacts are uploadable and set bucket variable in deploy.sh.
```sh
source deploy.sh

```
Invoke on AWS

```sh
curl -i $API_GATEWAY_URL/your_name
```


#