control "VCST-67-000030" do
  title "The Security Token Service must set the secure flag for cookies."
  desc  "The secure flag is an option that can be set by the application server
when sending a new cookie to the user within an HTTP Response. The purpose of
the secure flag is to prevent cookies from being observed by unauthorized
parties due to the transmission of a the cookie in clear text. By setting the
secure flag, the browser will prevent the transmission of a cookie over an
unencrypted channel. The Security Token Service is configured to only be
accessible over a TLS tunnel but this cookie flag is still a recommended best
practice."
  impact 0.5
  tag severity: "CAT II"
  tag gtitle: "SRG-APP-000439-WSR-000155"
  tag gid: nil
  tag rid: "VCST-67-000030"
  tag stig_id: "VCST-67-000030"
  tag fix_id: nil
  tag cci: "CCI-002418"
  tag nist: ["SC-8", "Rev_4"]
  tag false_negatives: nil
  tag false_positives: nil
  tag documentable: nil
  tag mitigations: nil
  tag severity_override_guidance: nil
  tag potential_impacts: nil
  tag third_party_tools: nil
  tag mitigation_controls: nil
  tag responsibility: nil
  tag ia_controls: "SC-8"
  tag check: "At the command prompt, execute the following command:

# xmllint --format /usr/lib/vmware-sso/vmware-sts/conf/web.xml | sed '2
s/xmlns=\".*\"//g' | xmllint --xpath
'/web-app/session-config/cookie-config/secure' -

Expected result:

<secure>true</secure>

If the output of the command does not match the expected result, this is a
finding."
  tag fix: "Navigate to and open /usr/lib/vmware-sso/vmware-sts/conf/web.xml

Navigate to the /<web-apps>/<session-config>/<cookie-config> node and configure
it as follows.

    <cookie-config>
      <http-only>true</http-only>
      <secure>true</secure>
    </cookie-config>"
end

