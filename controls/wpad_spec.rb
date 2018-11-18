# frozen_string_literal: true

control 'proxyautodiscovery-01' do
  impact 1.0
  title 'Ensure Proxy Auto Discovery is disabled'
  desc 'Proxy Auto Discovery can be easily exploited by attacker'
  # requires root, depends on network interface
  describe command('networksetup -getproxyautodiscovery "Thunderbolt Bridge"') do
    its('stdout') { should match 'Auto Proxy Discovery: Off' }
  end
  describe command('networksetup -getproxyautodiscovery Wi-Fi') do
    its('stdout') { should match 'Auto Proxy Discovery: Off' }
  end
  describe command('networksetup -getproxyautodiscovery "Bluetooth PAN"') do
    its('stdout') { should match 'Auto Proxy Discovery: Off' }
  end
  describe command('networksetup -getproxyautodiscovery "USB 10/100/1000 LAN"') do
    its('stdout') { should match 'Auto Proxy Discovery: Off' }
  end
end
