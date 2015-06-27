bash "install Jupyter" do
  user "root"
  cwd "/home/ubuntu"
  code <<-EOH
  npm install -g configurable-http-proxy
  echo "#{node[:aws][:ssh_key]}" >> sparkclusterkey.pem
  EOH
end
