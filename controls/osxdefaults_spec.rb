# encoding: utf-8

control 'osx_defaults-01' do
  impact 1.0
  title 'AutoUpdates check enabled'
  desc 'Automatic Updates check should be enabled'
  describe command('defaults read /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled') do
    its('stdout') { should match '1' }
  end
  # describe command('defaults read /Library/Preferences/com.apple.SoftwareUpdate AutoUpdate') do
  #  its('stdout') { should match /1/ }
  # end
end
