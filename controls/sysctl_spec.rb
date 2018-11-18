# frozen_string_literal: true

control 'sysctl-01' do
  impact 1.0
  title 'IPv4 Forwarding'
  desc "If you're not intending for your system to forward traffic between interfaces, or if you only have a single interface, the forwarding function must be disable."
  describe kernel_parameter('net.inet.ip.forwarding') do
    its(:value) { should eq 0 }
  end
  describe kernel_parameter('net.inet6.ip6.forwarding') do
    its(:value) { should eq 0 }
  end
end

control 'sysctl-02' do
  impact 1.0
  title 'Encrypted Swap'
  desc 'Check that systctl returns encrypted swap state'
  describe kernel_parameter('vm.swapusage') do
    its(:value) { should match(/encrypted/) }
  end
end
