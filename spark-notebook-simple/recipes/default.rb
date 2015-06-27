bash "install Jupyter" do
  user "root"
  cwd "/home/ubuntu"
  code <<-EOH
    npm install -g configurable-http-proxy
    echo "#{node[:aws][:ssh_key]}" >> sparkclusterkey.pem
    chmod 600 sparkclusterkey.pem
    wget http://apache.crihan.fr/dist/spark/spark-1.4.0/spark-1.4.0-bin-hadoop2.6.tgz
    tar xvzf spark-1.4.0-bin-hadoop2.6.tgz
    rm spark-1.4.0-bin-hadoop2.6.tgz
    echo "export AWS_ACCESS_KEY_ID=#{node[:aws][:access]}" >> .bash_profile
    echo "export AWS_SECRET_ACCESS_KEY=#{node[:aws][:secret]}" >> .bash_profile
    git clone https://github.com/jupyter/jupyterhub.git
    cd jupyterhub
    apt-get install python3-pip
    pip3 install -r requirements.txt
    pip3 install .
    wget https://oss.sonatype.org/content/repositories/snapshots/com/github/alexarchambault/jupyter/jupyter-scala-cli_2.10.5/0.2.0-SNAPSHOT/jupyter-scala_2.10.5-0.2.0-SNAPSHOT.tar.xz
    tar xf jupyter-scala_2.10.5-0.2.0-SNAPSHOT.tar.xz
    cd jupyter-scala_2.10.5-0.2.0-SNAPSHOT
    ./jupyter-scala
    jupyterhub --port #{node[:jupyter][:port]}
  EOH
end

user node[:jupyter][:user] do
  supports :manage_home => true
  password node[:jupyter][:password]}
end
