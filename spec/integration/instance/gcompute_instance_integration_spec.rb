require 'spec_helper'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

describe 'instance.create', vcr: true do
  it 'creates non-existent instance' do
    VCR.use_cassette('create_instance') do
      example = get_example('instance')
      apply_with_error_check(example)
    end
  end
end
