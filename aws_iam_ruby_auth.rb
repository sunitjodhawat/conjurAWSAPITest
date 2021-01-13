require 'aws-sigv4'
require 'aws-sdk'
require 'conjur-api'


#Conjur.configuration.account = 'myConjurAccount'
#Conjur.configuration.appliance_url = 'https://nginx_proxy/authn-iam/prod'
#Conjur.configuration.cert_file = '/conjur.pem'
#Conjur.configuration.apply_cert_config!

#conjur = Conjur::API.new_from_key 'host/aws/606162195851:role/Sunit_Jenkins_Test_AWS/secretApp', request.to_json

request = Aws::Sigv4::Signer.new(
  service: 'sts',
  region: 'ap-southeast2',
  access_key_id: ' ',
  secret_access_key: ' '
).sign_request(
  http_method: 'GET',
 url: 'https://sts.amazonaws.com/?Action=GetCallerIdentity&Version=2011-06-15'
).headers

print request


Conjur.configuration.account = 'myConjurAccount'
Conjur.configuration.appliance_url = 'https://nginx_proxy/conjur/authn-iam/prod'
Conjur.configuration.cert_file = '/tmp/conjur.pem'
Conjur.configuration.apply_cert_config!



#request = Aws::Sigv4::Signer.new(
#  service: 'sts',
#  region: 'ap-southeast2',
#  credentials_provider: Aws::InstanceProfileCredentials.new
#).sign_request(
#  http_method: 'GET',
#  url: 'https://sts.amazonaws.com/?Action=GetCallerIdentity&Version=2011-06-15'
#).headers

#print request

print "\n calling API \n"

conjur = Conjur::API.new_from_key 'host/aws/606162195851:Sunit_Jenkins_Test_AWS/secretApp', request.to_json

#print conjur

print "Conjur Response .......\n"

print conjur.to_json

print "\n"


print conjur

print "\n"
