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
      require 'byebug'
      example = get_example('instance')
      Dir.chdir('spec/fixtures/modules') do
        byebug
        apply_compiled_manifest(example)
      end
    end
  end
end
