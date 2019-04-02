# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

name "windows-base"
default_source :supermarket

cookbook 'myaudit', github: 'seankbeard/cookbooks', branch: 'master', rel: 'myaudit'

run_list 'chef-client', 'windows-hardening', 'myaudit'

# Override the Chef Client cookbook with the following attributes
override['chef_client']['interval']    = '200'
override['chef_client']['splay']       = '30'
##override['windows_hardening']['rdp']['harden'] = false
override['security_policy']['rights']['SeNetworkLogonRight'] = '*S-1-5-32-544'