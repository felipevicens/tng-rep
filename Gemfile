## Copyright (c) 2015 SONATA-NFV, 2017 5GTANGO [, ANY ADDITIONAL AFFILIATION]
## ALL RIGHTS RESERVED.
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
##
## Neither the name of the SONATA-NFV, 5GTANGO [, ANY ADDITIONAL AFFILIATION]
## nor the names of its contributors may be used to endorse or promote
## products derived from this software without specific prior written
## permission.
##
## This work has been performed in the framework of the SONATA project,
## funded by the European Commission under Grant number 671517 through
## the Horizon 2020 and 5G-PPP programmes. The authors would like to
## acknowledge the contributions of their colleagues of the SONATA
## partner consortium (www.sonata-nfv.eu).
##
## This work has been performed in the framework of the 5GTANGO project,
## funded by the European Commission under Grant number 761493 through
## the Horizon 2020 and 5G-PPP programmes. The authors would like to
## acknowledge the contributions of their colleagues of the 5GTANGO
## partner consortium (www.5gtango.eu).

source 'https://rubygems.org'

gem 'addressable', '~> 2.3.8'
gem 'ci_reporter_rspec', '~> 1.0'
gem 'curb', '~> 0.9.3' # Better performance Rest gem
gem 'json', '~>1.8'
gem 'json-schema', '~>2.5'
gem 'jwt', '~> 1.5.5' # Json Web Token gem
gem 'puma', '~> 3.11.0'
gem 'rake', '~> 12.3.0'
gem 'rubyzip'
gem 'sinatra', '~> 2.0.2', require: 'sinatra/base'
gem 'sinatra-contrib', '~> 2.0.2', require: false
gem 'tng-gtk-utils', '0.5.1'

group :development, :test do
  gem 'license_finder', '~> 2.1.2'
  gem 'rack-test', '~> 0.6', require: 'rack/test'
  gem 'rspec', '~> 3.7.0'
  gem 'rspec-its', '~> 1.2.0'
  gem 'rspec-mocks', '~> 3.7.0'
  gem 'rubocop', '~> 0.52.1'
  gem 'rubocop-checkstyle_formatter', '~> 0.4.0', require: false
  gem 'webmock', '~> 3.1.1'
end

group :doc do
  gem 'yard', '~>0.9.12'
end

# Database
gem 'mongoid', '~>4.0' # MongoDB driver
gem 'mongoid-grid_fs', '~>2.2' # mongoid-grid_fs-2.2 - GridFS for store bin data
gem 'mongoid-pagination', '~>0.2' # Pagination library
