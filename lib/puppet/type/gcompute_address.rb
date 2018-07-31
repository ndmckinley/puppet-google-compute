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

require 'google/compute/property/address_address_type'
require 'google/compute/property/integer'
require 'google/compute/property/region_name'
require 'google/compute/property/string'
require 'google/compute/property/string_array'
require 'google/compute/property/subnetwork_selflink'
require 'google/compute/property/time'
require 'google/object_store'
require 'puppet'

Puppet::Type.newtype(:gcompute_address) do
  @doc = <<-DOC
    Represents an Address resource. Each virtual machine instance has an
    ephemeral internal IP address and, optionally, an external IP address. To
    communicate between instances on the same network, you can use an
    instance's internal IP address. To communicate with the Internet and
    instances outside of the same network, you must specify the instance's
    external IP address. Internal IP addresses are ephemeral and only belong to
    an instance for the lifetime of the instance; if the instance is deleted
    and recreated, the instance is assigned a new internal IP address, either
    by Compute Engine or by you. External IP addresses can be either ephemeral
    or static.
  DOC

  autorequire(:gauth_credential) do
    credential = self[:credential]
    raise "#{ref}: required property 'credential' is missing" if credential.nil?
    [credential]
  end

  autorequire(:gcompute_region) do
    reference = self[:region]
    raise "#{ref} required property 'region' is missing" if reference.nil?
    reference.autorequires
  end

  ensurable

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
    desc 'The name of the Address.'
  end

  newparam(:region, parent: Google::Compute::Property::RegionNameRef) do
    desc <<-DOC
      URL of the region where the regional address resides. This field is not
      applicable to global addresses.
    DOC
  end

  newproperty(:address, parent: Google::Compute::Property::String) do
    desc <<-DOC
      The static external IP address represented by this resource. Only IPv4 is
      supported. An address may only be specified for INTERNAL address types.
      The IP address must be inside the specified subnetwork, if any.
    DOC
  end

  newproperty(:address_type,
              parent: Google::Compute::Property::AddressTypeEnum) do
    desc <<-DOC
      The type of address to reserve, either INTERNAL or EXTERNAL. If
      unspecified, defaults to EXTERNAL.
    DOC
    newvalue(:INTERNAL)
    newvalue(:EXTERNAL)
    defaultto 'EXTERNAL'
  end

  newproperty(:creation_timestamp, parent: Google::Compute::Property::Time) do
    desc 'Creation timestamp in RFC3339 text format. (output only)'
  end

  newproperty(:description, parent: Google::Compute::Property::String) do
    desc 'An optional description of this resource.'
  end

  newproperty(:id, parent: Google::Compute::Property::Integer) do
    desc 'The unique identifier for the resource. (output only)'
  end

  newproperty(:name, parent: Google::Compute::Property::String) do
    desc <<-DOC
      Name of the resource. The name must be 1-63 characters long, and comply
      with RFC1035. Specifically, the name must be 1-63 characters long and
      match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the
      first character must be a lowercase letter, and all following characters
      must be a dash, lowercase letter, or digit, except the last character,
      which cannot be a dash.
    DOC
  end

  newproperty(:subnetwork,
              parent: Google::Compute::Property::SubneSelfLinkRef) do
    desc <<-DOC
      The URL of the subnetwork in which to reserve the address. If an IP
      address is specified, it must be within the subnetwork's IP range. This
      field can only be used with INTERNAL type with GCE_ENDPOINT/DNS_RESOLVER
      purposes.
    DOC
  end

  newproperty(:users, parent: Google::Compute::Property::StringArray) do
    desc 'The URLs of the resources that are using this address. (output only)'
  end

  # Returns all properties that a provider can export to other resources
  def exports
    provider.exports
  end
end
