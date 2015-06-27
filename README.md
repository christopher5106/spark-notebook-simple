#Chef Cookbook to instantly deploy a Jupyter / iPython3 notebook with Scala, Python and Spark Cluster Launch on EC2


Create an Opsworks stack named "Spark" with

- Ubuntu 14.04
- a custom SSH key `sparkclusterkey`
- custom cookbooks with Chef git repository at `https://github.com/christopher5106/spark-notebook-simple.git`
- Berkshelf ON
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
		"secret":"SECRET_KEY_HERE",
		"ssh_key":"-----BEGIN RSA PRIVATE KEY-----\nMIIEowIBAA....\n-----END RSA PRIVATE KEY-----"
	},
	"jupyter":{
		"port":"80"
	}
}
```
where ssh_key is the private key pair `sparkclusterkey` created for EC2, new lines replaced with \n characters.

It's better to create a specific user, with AmazonEC2FullAccess policy and use its access keys rather than the root keys of your account.

Create a custom layer named "spark-notebook" in your stack.

Add the recipes `apt`, `ark`, `java`, `scala`,`sbt-extras`, `nodejs` and `spark-notebook-simple`.

Start an instance. That's it !
