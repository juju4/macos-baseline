# encoding: utf-8

control 'santa-01' do
  impact 1.0
  title 'Google Santa - Whitelist/blacklist binaries is installed'
  desc "Google Santa ensure monitoring of every binary executed on MacOS and can eventually whitelist or blacklist"
  describe file('/var/db/santa/config.plist') do
    it { should be_file }
    it { should be_owned_by 'root' }
    its('size') { should > 0 }
  end
  describe file('/var/db/santa/rules.db') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_readable.by('owner') }
#    it { should not be_readable.by('other') }
    its('size') { should > 0 }
  end
  describe processes('santad') do
    its('users') { should cmp 'root' }
  end
end

