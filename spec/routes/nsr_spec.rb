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

require_relative '../spec_helper'
require 'webmock/rspec'
require 'json'
require 'securerandom'
require 'pp'
require 'rspec/its'

RSpec.describe SonataNsRepository do
  def app
    @app ||= SonataNsRepository
  end

  describe 'GET \'/doc\'' do
    before do
      stub_request(:get, 'localhost:5000').to_return(status: 200,
                                                     body: '---\n- uri: \"/\"\n  method: GET\n  purpose: REST API Structure and Capability Discovery\n- uri: \"/records/nsr/\"\n  method: GET\n  purpose: REST API Structure and Capability Discovery nsr\n- uri: \"/records/vnfr/\"\n  method: GET\n  purpose: REST API Structure and Capability Discovery vnfr\n- uri: \"/catalogues/\"\n  method: GET\n  purpose: REST API Structure and Capability Discovery catalogues\n')
      get '/doc'
    end
    subject { last_response }
    its(:status) { is_expected.to eq 200 }
  end

  describe 'GET \'/pings\'' do
    before do
      stub_request(:get, 'localhost:5000').to_return(status: 200,
                                                     body: 'pong')
      get '/pings'
    end
    subject { last_response }
    its(:status) { is_expected.to eq 200 }
  end

  let(:ns_instance_record) {Rack::Test::UploadedFile.new('./spec/fixtures/nsr-example.json','application/json', true)}
  describe 'POST \'/\'' do
    context 'with correct parameters' do
      it 'Submit an nsr' do
        headers = { 'CONTENT_TYPE' => 'application/json' }
        post '/', ns_instance_record, headers
        expect(last_response).to be_ok
      end
    end
  end

  let(:ns_instance_record) {Rack::Test::UploadedFile.new('./spec/fixtures/nsr-example.json','application/json', true)}
  describe 'POST \'\'' do
    context 'Duplicated nsr' do
      it 'Submit a duplicated nsr' do
        headers = { 'CONTENT_TYPE' => 'application/json' }
        post '/', ns_instance_record, headers
        expect(last_response.status).to eq(409)
      end
    end
  end

  let(:ns_instance_bad_record) {Rack::Test::UploadedFile.new('./spec/fixtures/nsr-example-with-errors.json',
                                                             'application/json', true)}
  describe 'POST \'\'' do
    context 'with incorrect parameters' do
      it 'Submit an invalid nsr' do
        headers = { 'CONTENT_TYPE' => 'application/json' }
        post '/', ns_instance_bad_record, headers
        expect(last_response.status).to eq(422)
      end
    end
  end

  describe 'GET /' do
    context 'without (UU)ID given' do
      before do
        get '/'
      end
      subject { last_response }
      its(:status) { is_expected.to eq 200 }
    end
  end

  describe 'GET /:uuid' do
    context 'with (UU)ID given' do
      before do
        get '/32adeb1e-d981-16ec-dc44-e288e80067a1'
      end
      subject { last_response }
      its(:status) { is_expected.to eq 200 }
    end
  end

  describe 'DELETE /:uuid' do
    context 'with (UU)ID given' do
      before do
        delete '/32adeb1e-d981-16ec-dc44-e288e80067a1'
      end
      subject { last_response }
      its(:status) { is_expected.to eq 200 }
    end
  end
end
