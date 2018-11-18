# frozen_string_literal: true

objectivesee_check = attribute(
  'objectivesee_check',
  default: true,
  description: 'Control if Objective-tools are present'
)
objectivesee_files = attribute(
  'objectivesee_files',
  default: [
    '/Library/Objective-See/BlockBlock',
    '/Library/RansomWhere/RansomWhere',
    '/Applications/OverSight.app/Contents/Library/LoginItems/OverSightXPC.xpc',
    '/Applications/LuLu.app/Contents/MacOS/LuLu'
  ],
  description: 'list of objective-see files to control'
)

control 'objectivesee-01' do
  impact 1.0
  title 'Ensure ObjectiveSee excellent suite of tools is present'
  desc 'ObjectiveSee tools are great defense in depth tools to cover persistence, ransomware and other cases'
  objectivesee_files.each do |file|
    describe file(file.to_s) do
      it { should be_file }
      it { should be_owned_by 'root' }
      its('size') { should be.positive? }
    end
  end
  only_if { objectivesee_check == true }
end
