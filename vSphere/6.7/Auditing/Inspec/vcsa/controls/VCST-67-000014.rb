control "VCST-67-000014" do
  title "The Security Token Service must not have the Web Distributed Authoring
(WebDAV) servlet installed."
  desc  "Web Distributed Authoring (WebDAV) is an extension to the HTTP
protocol that, when developed, was meant to allow users to create, change, and
move documents on a server, typically a web server or web share. WebDAV is not
widely used and has serious security concerns because it may allow clients to
modify unauthorized files on the web server and must therefore be disabled.

    Tomcat uses the org.apache.catalina.servlets.WebdavServlet servlet to
provide WebDAV services. Because the WebDAV service has been found to have an
excessive number of vulnerabilities, this servlet must not be installed. The
Security Token Service does not configure WebDAV by default.
  "
  impact 0.5
  tag severity: "CAT II"
  tag gtitle: "SRG-APP-000141-WSR-000085"
  tag gid: nil
  tag rid: "VCST-67-000014"
  tag stig_id: "VCST-67-000014"
  tag fix_id: nil
  tag cci: "CCI-000381"
  tag nist: ["CM-7 a", "Rev_4"]
  tag false_negatives: nil
  tag false_positives: nil
  tag documentable: nil
  tag mitigations: nil
  tag severity_override_guidance: nil
  tag potential_impacts: nil
  tag third_party_tools: nil
  tag mitigation_controls: nil
  tag responsibility: nil
  tag ia_controls: "CM-7 a"
  tag check: "At the command prompt, execute the following command:

# grep -n 'webdav' /usr/lib/vmware-sso/vmware-sts/conf/web.xml

If the command produces any output, this is a finding."
  tag fix: "Navigate to and open /usr/lib/vmware-sso/vmware-sts/conf/web.xml.

Find the <servlet-name>webdav</servlet-name> node and remove the entire parent
<servlet> block.

Find the <servlet-name>webdav</servlet-name> node and remove the entire parent
<servlet-mapping> block."
end

