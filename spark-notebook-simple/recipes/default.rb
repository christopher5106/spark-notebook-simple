bash "install Jupyter" do
  user "root"
  cwd "/home/ubuntu"
  code <<-EOH
  npm install -g configurable-http-proxy
  EOH
end
