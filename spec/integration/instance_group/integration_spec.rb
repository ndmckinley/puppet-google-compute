# Copyright 2018 Google Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------
require 'spec_helper'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

describe 'instance_group.create', vcr: true do
  mods = [File.expand_path('.'), File.expand_path('./spec/fixtures/modules/')]
  it 'creates and destroys non-existent instance_group' do
    puts 'pre-destroying instance_group'
    VCR.use_cassette('pre_destroy_instance_group') do
      test = Puppet::Node::Environment.create(:test, mods)
      Puppet.override(current_environment: test) do
        Puppet[:environment] = 'special'
        puppet = Puppet::Application[:apply]
        puppet.stubs(:command_line).returns(
          stub('command_line', args: [write_example('delete_instance_group')])
        )
        begin
          puppet.run_command
        rescue SystemExit => e
          expect(e.status).to eq 0
        end
      end
    end

    puts 'creating instance_group'
    VCR.use_cassette('create_instance_group') do
      test = Puppet::Node::Environment.create(:test, mods)
      Puppet.override(current_environment: test) do
        Puppet[:environment] = 'special'
        puppet = Puppet::Application[:apply]
        puppet.stubs(:command_line).returns(
          stub('command_line', args: [write_example('instance_group')])
        )
        begin
          puppet.run_command
        rescue SystemExit => e
          expect(e.status).to eq 0
        end
      end
    end
    puts 'checking that instance_group is created'
    VCR.use_cassette('check_instance_group') do
      test = Puppet::Node::Environment.create(:test, mods)
      Puppet.override(current_environment: test) do
        Puppet[:environment] = 'special'
        puppet = Puppet::Application[:apply]
        puppet.stubs(:command_line).returns(
          stub('command_line', args: [write_example('instance_group')])
        )
        begin
          omnistub_put = stub_request(:put, /google/)
                         .to_raise("Shouldn't have made network call.")
          omnistub_post = stub_request(:post, /google/)
                          .to_raise("Shouldn't have made network call.")
          omnistub_patch = stub_request(:patch, /google/)
                           .to_raise("Shouldn't have made network call.")
          puppet.run_command
        rescue SystemExit => e
          expect(e.status).to eq 0
          remove_request_stub(omnistub_put)
          remove_request_stub(omnistub_post)
          remove_request_stub(omnistub_patch)
        end
      end
    end
    puts 'destroying instance_group'
    VCR.use_cassette('destroy_instance_group') do
      test = Puppet::Node::Environment.create(:test, mods)
      Puppet.override(current_environment: test) do
        Puppet[:environment] = 'special'
        puppet = Puppet::Application[:apply]
        puppet.stubs(:command_line).returns(
          stub('command_line', args: [write_example('delete_instance_group')])
        )
        begin
          puppet.run_command
        rescue SystemExit => e
          expect(e.status).to eq 0
        end
      end
    end
    puts 'checking that instance_group is destroyed'
    VCR.use_cassette('check_instance_group') do
      test = Puppet::Node::Environment.create(:test, mods)
      Puppet.override(current_environment: test) do
        Puppet[:environment] = 'special'
        puppet = Puppet::Application[:apply]
        puppet.stubs(:command_line).returns(
          stub('command_line', args: [write_example('delete_instance_group')])
        )
        begin
          omnistub_put = stub_request(:put, /google/)
                         .to_raise("Shouldn't have made network call.")
          omnistub_post = stub_request(:post, /google/)
                          .to_raise("Shouldn't have made network call.")
          omnistub_patch = stub_request(:patch, /google/)
                           .to_raise("Shouldn't have made network call.")
          puppet.run_command
        rescue SystemExit => e
          expect(e.status).to eq 0
          remove_request_stub(omnistub_put)
          remove_request_stub(omnistub_post)
          remove_request_stub(omnistub_patch)
        end
      end
    end
  end
end
