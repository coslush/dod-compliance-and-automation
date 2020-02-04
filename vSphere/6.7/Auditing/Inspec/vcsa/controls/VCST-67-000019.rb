control "VCST-67-000019" do
  title "The Security Token Service must limit the number of allowed
connections."
  desc  "Limiting the number of established connections to the Security Token
Service is a basic DoS protection. Servers where the limit is too high or
unlimited can potentially run out of system resources and negatively affect
system availability."
  impact 0.5
  tag severity: "CAT II"
  tag gtitle: "SRG-APP-000246-WSR-000149"
  tag gid: nil
  tag rid: "VCST-67-000019"
  tag stig_id: "VCST-67-000019"
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

# xmllint --format /usr/lib/vmware-sso/vmware-sts/conf/server.xml | sed '2
s/xmlns=\".*\"//g' | xmllint --xpath
'/Server/Service/Connector[@port=\"${bio-custom.http.port}\"]/@acceptCount' -

Expected result:

acceptCount=\"100\"

If the output does not match the expected result, this is a finding"
  tag fix: "Navigate to and open /usr/lib/vmware-sso/vmware-sts/conf/server.xml

Navigate to the <Connector> configured with port=\"${bio-custom.http.port}\".
Add or change the folllowing value:

acceptCount=\"100\""
end

