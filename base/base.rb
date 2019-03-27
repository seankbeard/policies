# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name "base"

# Where to find external cookbooks:
default_source :supermarket

# Specify a custom source for a cookbook:
cookbook 'chef-client', github: 'seankbeard/cookbooks', branch: 'master', rel: 'chef-client'
cookbook 'myaudit', github: 'seankbeard/cookbooks', branch: 'master', rel: 'myaudit'

# # run_list: chef-client will run these recipes in the order specified.
run_list 'chef-client'
run_list 'myaudit::default'

# Override the Chef Client cookbook with the following attributes
override['chef_client']['interval']    = '200'
override['chef_client']['splay']       = '30'
