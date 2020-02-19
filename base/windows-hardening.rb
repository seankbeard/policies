# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'windows-hardening'

# Where to find external cookbooks:
default_source :supermarket
cookbook 'windows-hardening', '~> 0.9.1', :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'windows-hardening::default'

# Specify a custom source for a single cookbook:
# cookbook 'example_cookbook', path: '../cookbooks/example_cookbook'

##override['windows_hardening']['rdp']['harden'] = false
override['security_policy']['rights']['SeNetworkLogonRight'] = '*S-1-5-32-544'