# frozen_string_literal: true

control 'firewall-01' do
  impact 1.0
  title 'Ensure system firewall is configured'
  desc 'Host firewall is part of defense in depth'
  describe file('/private/etc/pf.conf') do
    it { should be_file }
    it { should be_owned_by 'root' }
    its('mode') { should cmp '0644' }
  end
  # requires root
  describe command('pfctl -sr') do
    its('stdout') { should match 'scrub-anchor' }
    its('stdout') { should match 'pass in log proto tcp from <private> to any port 22' }
  end
end
