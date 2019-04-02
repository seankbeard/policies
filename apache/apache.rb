# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name "webserver"
include_policy 'base', path: "../base/base.lock.json"
default_source :supermarket
cookbook 'apache', github: 'seankbeard/cookbooks', branch: 'master', rel: 'apache'

run_list 'apache::default', 'os-hardening'
