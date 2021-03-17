# encoding: UTF-8

control 'ESXI-70-000034' do
  title 'The ESXi host must disable the Managed Object Browser (MOB).'
  desc  "The Managed Object Browser (MOB) provides a way to explore the object
model used by the VMkernel to manage the host and enables configurations to be
changed as well. This interface is meant to be used primarily for debugging the
vSphere SDK, but because there are no access controls it could also be used as
a method obtain information about a host being targeted for unauthorized
access."
  desc  'rationale', ''
  desc  'check', "
    From the vSphere Client go to Hosts and Clusters >> Select the ESXi Host >>
Configure >> System >> Advanced System Settings. Select the
\"Config.HostAgent.plugins.solo.enableMob\" value and verify it is set to
\"false\".

    or

    From a PowerCLI command prompt while connected to the ESXi host run the
following command:

    Get-VMHost | Get-AdvancedSetting -Name
Config.HostAgent.plugins.solo.enableMob

    If the \"Config.HostAgent.plugins.solo.enableMob\" setting is not set to
\"false\", this is a finding.
  "
  desc  'fix', "
    From the vSphere Client go to Hosts and Clusters >> Select the ESXi Host >>
Configure >> System >> Advanced System Settings. Click \"Edit\". Select the
\"Config.HostAgent.plugins.solo.enableMob\" value and configure it to \"false\".

    or

    From a PowerCLI command prompt while connected to the ESXi host run the
following command(s):

    Get-VMHost | Get-AdvancedSetting -Name
Config.HostAgent.plugins.solo.enableMob | Set-AdvancedSetting -Value false
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-OS-000095-VMM-000480'
  tag gid: nil
  tag rid: nil
  tag stig_id: 'ESXI-70-000034'
  tag fix_id: nil
  tag cci: 'CCI-000381'
  tag nist: ['CM-7 a']

  command = "(Get-VMHost -Name #{input('vmhostName')}) | Get-AdvancedSetting -Name Config.HostAgent.plugins.solo.enableMob | Select-Object -ExpandProperty Value"
  describe powercli_command(command) do
    its ('stdout.strip') { should cmp "false" }
  end

end

