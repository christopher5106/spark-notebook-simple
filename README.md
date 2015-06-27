#Chef Cookbook to instantly deploy a Jupyter / iPython3 notebook with Scala, Python and Spark on EC2


Create an Opsworks stack named "Spark" with 

- Ubuntu 14.04
- customed cookbooks with Chef git repository at `https://github.com/christopher5106/spark-notebook-simple.git` 
- Berkshelf activ
- a custom JSON

```json
	{
		"environment":"spark-notebook-simple",
		"java": {
			"jdk_version":"7",
			"oracle":{"accept_oracle_download_terms":"true"},
			"accept_license_agreement":"true",
			"install_flavor":"oracle"
		},
		"aws":{
			"bucket":"A_S3_BUCKET",
			"access":"ACCESS_KEY_HERE",
			"secret":"SECRET_KEY_HERE"
		}
	}
```

It's better to create a specific user, with AmazonEC2FullAccess policy and use its access keys rather than the root keys of your account.

Create a custom layer named "spark-notebook" in your stack.

Add the recipe `spark-notebook-simple`.

Start an instance. That's it !