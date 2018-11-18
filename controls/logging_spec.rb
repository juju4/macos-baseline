# frozen_string_literal: true

control 'logging-01' do
  impact 1.0
  title 'Ensure system logs are available'
  desc 'Logging is critical to system management'
  # not in vagrant macos?
  # describe file('/var/log/authd.log') do
  #  it { should be_file }
  #  it { should be_owned_by 'root' }
  #  its('size') { should > 0 }
  # end
  describe file('/var/log/system.log') do
    it { should be_file }
    it { should be_owned_by 'root' }
    its('size') { should > 0 }
  end
  describe file('/var/log/install.log') do
    it { should be_file }
    it { should be_owned_by 'root' }
    its('size') { should > 0 }
  end
  describe processes('syslogd') do
    its('users') { should cmp 'root' }
  end
end
