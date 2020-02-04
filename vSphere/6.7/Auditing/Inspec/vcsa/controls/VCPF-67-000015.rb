control "VCPF-67-000015" do
  title "Performance Charts must not have any symbolic links in the web content
directory tree."
  desc  "A web server is designed to deliver content and execute scripts or
applications on the request of a client or user. Containing user requests to
files in the directory tree of the hosted web application and limiting the
execution of scripts and applications guarantees that the user is not accessing
information protected outside the application's realm. By checking that no
symbolic links exist in the document root, the web server is protected from
users jumping outside the hosted application directory tree and gaining access
to the other directories, including the system root."
  impact 0.5
  tag severity: "CAT II"
  tag gtitle: "SRG-APP-000141-WSR-000087"
  tag gid: nil
  tag rid: "VCPF-67-000015"
  tag stig_id: "VCPF-67-000015"
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

# find /usr/lib/vmware-perfcharts/tc-instance/webapps/ -type l -ls

If the command produces any output, this is a finding."
  tag fix: "At the command prompt, execute the following commands:

Note: Replace <file_name> for the name of any files that were returned.

# unlink <file_name>

Repeat the commands for each file that was returned."

  describe command('find /usr/lib/vmware-perfcharts/tc-instance/webapps/ -type l -ls') do
    its ('stdout.strip') { should eq '' }
  end

end