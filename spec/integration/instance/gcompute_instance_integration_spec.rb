require 'spec_helper'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes/instance'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

describe 'instance.create', vcr: true do
  it 'creates and destroys non-existent instance' do
    puts 'creating instance'
    VCR.use_cassette('create_instance') do
      example = get_example('instance')
      apply_with_error_check(example)
    end
    puts 'checking that instance is created'
    VCR.use_cassette('check_instance') do
      example = get_example('instance')
      apply_compiled_manifest(example) do |res|
        if res.provider&.respond_to? 'flush'
          # Any request to Google APIs during a flush is not
          # acceptable - that means that a diff was detected.
          omnistub = stub_request(:any, /google/)
                     .to_raise("Shouldn't have made network call.")
          res.provider.flush
          remove_request_stub(omnistub)
        end
      end
    end
    puts 'destroying instance'
    VCR.use_cassette('destroy_intance') do
      example = get_example('delete_instance')
      apply_with_error_check(example)
    end
    puts 'confirming instance destroyed'
    VCR.use_cassette('check_destroy') do
      example = get_example('delete_instance')
      apply_compiled_manifest(example) do |res|
        if res.provider&.respond_to? 'flush'
          # Any request to Google APIs during a flush is not
          # acceptable - that means that the object still needs
          # to be deleted.
          omnistub = stub_request(:any, /google/)
                     .to_raise("Shouldn't have made network call.")
          res.provider.flush
          remove_request_stub(omnistub)
          expect(res.provider.instance_variable_get(:@deleted)).to eq(nil)
        end
      end
    end
  end
end
