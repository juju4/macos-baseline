# encoding: utf-8

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

