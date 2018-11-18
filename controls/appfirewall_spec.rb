# frozen_string_literal: true

control 'appfirewall-01' do
  impact 1.0
  title 'Ensure application firewall is configured'
  desc 'Host application firewall is part of defense in depth - root required'
  describe command('/usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate') do
    its('stdout') { should match 'Firewall is enabled. (State = 1)' }
  end
  describe command('/usr/libexec/ApplicationFirewall/socketfilterfw --getloggingmode') do
    its('stdout') { should match 'Log mode is on' }
  end
  describe command('/usr/libexec/ApplicationFirewall/socketfilterfw --getallowsigned') do
    its('stdout') { should match 'Automatically allow built-in signed software DISABLED' }
    its('stdout') { should match 'Automatically allow downloaded software DISABLED' }
  end
  describe command('/usr/libexec/ApplicationFirewall/socketfilterfw --listapps') do
    its('stdout') { should match 'NetAuthSysAgent' }
    its('stdout') { should match 'netbiosd' }
    its('stdout') { should match 'sshd-keygen-wrapper' }
  end
end
