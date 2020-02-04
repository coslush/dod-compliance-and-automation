control "VCST-67-000003" do
  title "The Security Token Service must limit the maximum size of a POST
request."
  desc  "The 'maxPostSize' value is the maximum size in bytes of the POST which
will be handled by the container FORM URL parameter parsing. Limit its size to
reduce exposure to a DOS attack. If 'maxPostSize' is not set, the default value
of 2097152 (2MB) is used. Security Token Service is configured in it's shipping
state to not set a value for 'maxPostSize'."
  impact 0.5
  tag severity: "CAT II"
  tag gtitle: "SRG-APP-000001-WSR-000001"
  tag gid: nil
  tag rid: "VCST-67-000003"
  tag stig_id: "VCST-67-000003"
  tag fix_id: nil
  tag cci: "CCI-000054"
  tag nist: ["AC-10", "Rev_4"]
  tag false_negatives: nil
  tag false_positives: nil
  tag documentable: nil
  tag mitigations: nil
  tag severity_override_guidance: nil
  tag potential_impacts: nil
  tag third_party_tools: nil
  tag mitigation_controls: nil
  tag responsibility: nil
  tag ia_controls: "AC-10"
  tag check: "At the command prompt, execute the following command:

# xmllint --format /usr/lib/vmware-sso/vmware-sts/conf/server.xml | sed '2
s/xmlns=\".*\"//g' | xmllint --xpath
'/Server/Service/Connector[@port=\"${bio-custom.http.port}\"]/@maxPostSize' -

Expected result:

XPath set is empty

If the output does not match the expected result, this is a finding."
  tag fix: "Navigate to and open /usr/lib/vmware-sso/vmware-sts/conf/server.xml

Navigate to each of the <Connector> nodes.

Remove any configuration for 'maxPostSize'.
"
end

