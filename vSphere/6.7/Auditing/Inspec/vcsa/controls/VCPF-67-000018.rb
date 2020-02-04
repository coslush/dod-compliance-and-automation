control "VCPF-67-000018" do
  title "Performance Charts must to limit the number of allowed connections."
  desc  "Limiting the number of established connections to Performance Charts
is a basic DoS protection. Servers where the limit is too high or unlimited can
potentially run out of system resources and negatively affect system
availability."
  impact 0.5
  tag severity: "CAT II"
  tag gtitle: "SRG-APP-000246-WSR-000149"
  tag gid: nil
  tag rid: "VCPF-67-000018"
  tag stig_id: "VCPF-67-000018"
  tag fix_id: nil
  tag cci: "CCI-001094"
  tag nist: ["SC-5 (1)", "Rev_4"]
  tag false_negatives: nil
  tag false_positives: nil
  tag documentable: nil
  tag mitigations: nil
  tag severity_override_guidance: nil
  tag potential_impacts: nil
  tag third_party_tools: nil
  tag mitigation_controls: nil
  tag responsibility: nil
  tag ia_controls: "SC-5 (1)"
  tag check: "At the command prompt, execute the following command:

# xmllint --xpath '/Server/Service/Connector/@acceptCount'
/usr/lib/vmware-perfcharts/tc-instance/conf/server.xml

Expected result:

acceptCount=\"300\"

If the output does not match the expected result, this is a finding"
  tag fix: "Navigate to and open
/usr/lib/vmware-perfcharts/tc-instance/conf/server.xml

Configure the <Connector> node with the value:

acceptCount=\"300\""

  describe xml('/usr/lib/vmware-perfcharts/tc-instance/conf/server.xml') do
    its(['Server/Service/Connector/@acceptCount']) { should cmp '300'}
  end

end