# Copyright 2017 Google Inc.
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

require 'spec_helper'

context 'check examples with puppet-lint' do
  let(:examples) { "#{File.dirname(__FILE__)}/../examples" }

  let(:command) { ['puppet-lint', '--fail-on-warnings', examples] }

  subject { Bundle.run(command) }

  it { is_expected.to be_zero }
end

context 'ensure puppet-lint recognizes bad manifests' do
  let(:poor_example) { "#{File.dirname(__FILE__)}/data/poor_example.pp" }

  let(:command) { ['puppet-lint', '--fail-on-warnings', poor_example] }

  subject { Bundle.run(command) }

  it { is_expected.not_to be_zero }
end
