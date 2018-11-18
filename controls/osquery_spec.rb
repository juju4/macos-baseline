# frozen_string_literal: true

control 'osquery-01' do
  impact 1.0
  title 'Facebook osquery is installed'
  desc 'Osquery allows deep monitoring of a system to detect and respond to security incidents'
  describe file('/var/osquery/osquery.conf') do
    it { should be_file }
    it { should be_owned_by 'root' }
    its('size') { should be.positive? }
  end
  describe file('/var/osquery/osquery.db') do
    it { should be_directory }
    it { should be_owned_by 'root' }
    it { should be_readable.by('owner') }
    # it { should not be_readable.by('other') }
  end
  describe file('/var/osquery/osquery.em') do
    it { should be_socket }
  end
  describe processes('osqueryd') do
    its('users') { should cmp 'root' }
  end
end
