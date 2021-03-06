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

require 'google/compute/property/boolean'
require 'google/compute/property/enum'
require 'google/compute/property/integer'
require 'google/compute/property/machinetype_deprecated'
require 'google/compute/property/string'
require 'google/compute/property/time'
require 'google/compute/property/zone_name'
require 'google/object_store'
require 'puppet'

Puppet::Type.newtype(:gcompute_machine_type) do
  @doc = <<-DOC
    Represents a MachineType resource. Machine types determine the virtualized hardware
    specifications of your virtual machine instances, such as the amount of memory or number of
    virtual CPUs.
  DOC

  autorequire(:gauth_credential) do
    credential = self[:credential]
    raise "#{ref}: required property 'credential' is missing" if credential.nil?
    [credential]
  end

  newparam :credential do
    desc <<-DESC
      A gauth_credential name to be used to authenticate with Google Cloud
      Platform.
    DESC
  end

  newparam(:project) do
    desc 'A Google Cloud Platform project to manage.'
  end

  newparam(:name, namevar: true) do
    # TODO(nelsona): Make this description to match the key of the object.
    desc 'The name of the MachineType.'
  end

  newproperty(:creation_timestamp, parent: Google::Compute::Property::Time) do
    desc 'Creation timestamp in RFC3339 text format. (output only)'
  end

  newproperty(:deprecated, parent: Google::Compute::Property::MachineTypeDepreca) do
    desc 'The deprecation status associated with this machine type. (output only)'
  end

  newproperty(:description, parent: Google::Compute::Property::String) do
    desc 'An optional textual description of the resource. (output only)'
  end

  newproperty(:guest_cpus, parent: Google::Compute::Property::Integer) do
    desc 'The number of virtual CPUs that are available to the instance. (output only)'
  end

  newproperty(:id, parent: Google::Compute::Property::Integer) do
    desc 'The unique identifier for the resource. (output only)'
  end

  newproperty(:is_shared_cpu, parent: Google::Compute::Property::Boolean) do
    desc <<-DOC
      Whether this machine type has a shared CPU. See Shared-core machine types for more
      information. (output only)
    DOC
    newvalue(:true)
    newvalue(:false)
  end

  newproperty(:maximum_persistent_disks, parent: Google::Compute::Property::Integer) do
    desc 'Maximum persistent disks allowed. (output only)'
  end

  newproperty(:maximum_persistent_disks_size_gb, parent: Google::Compute::Property::Integer) do
    desc 'Maximum total persistent disks size (GB) allowed. (output only)'
  end

  newproperty(:memory_mb, parent: Google::Compute::Property::Integer) do
    desc 'The amount of physical memory available to the instance, defined in MB. (output only)'
  end

  newproperty(:name, parent: Google::Compute::Property::String) do
    desc 'Name of the resource.'
  end

  newproperty(:zone, parent: Google::Compute::Property::ZoneNameRef) do
    desc 'The zone the machine type is defined.'
  end

  # Returns all properties that a provider can export to other resources
  def exports
    provider.exports
  end
end
