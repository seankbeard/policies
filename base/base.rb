# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

name "base"
default_source :supermarket

cookbook 'chef-client', github: 'seankbeard/cookbooks', branch: 'master', rel: 'chef-client'
cookbook 'myaudit', github: 'seankbeard/cookbooks', branch: 'master', rel: 'myaudit'

run_list 'chef-client'
run_list 'myaudit::default'
run_list 'os-hardening'

# Override the Chef Client cookbook with the following attributes
override['chef_client']['interval']    = '200'
override['chef_client']['splay']       = '30'
