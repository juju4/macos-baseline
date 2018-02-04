# encoding: utf-8

control 'audit-01' do
  impact 1.0
  title 'Ensure audit/openbsm is present'
  desc 'Logging is critical to system management'
  describe file('/private/etc/security/audit_control') do
    it { should be_file }
    it { should be_owned_by 'root' }
    its('mode') { should cmp '0400' }
    its('size') { should > 0 }
    # requires root access
    its('content') { should match /flags:lo,aa,ex,ad,nt/ }
  end
  describe file('/var/audit') do
    it { should be_directory }
    it { should be_owned_by 'root' }
    its('mode') { should cmp '0700' }
  end
end
