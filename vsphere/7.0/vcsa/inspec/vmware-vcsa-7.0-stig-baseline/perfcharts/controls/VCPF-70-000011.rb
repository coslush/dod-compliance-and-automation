# encoding: UTF-8

control 'VCPF-70-000011' do
  title "Performance Charts must be configured to limit access to internal
packages."
  desc  "The 'package.access' entry in the catalina.properties file implements
access control at the package level. When properly configured, a Security
Exception will be reported should an errant or malicious webapp attempt to
access the listed internal classes directly, or if a new class is defined under
the protected packages. Performance Charts comes pre-configured with the
appropriate packages defined in 'package.access' and this configuration must be
maintained. "
  desc  'rationale', ''
  desc  'check', "
    At the command prompt, execute the following command:

    # grep -A 6 \"package.access\"
/usr/lib/vmware-perfcharts/tc-instance/conf/catalina.properties

    Expected result:


package.access=sun.,org.apache.catalina.,org.apache.coyote.,org.apache.jasper.,org.apache.tomcat.

    If the output of the command does not match the expected result, this is a
finding.
  "
  desc  'fix', "
    Navigate to and open
/usr/lib/vmware-sso/vmware-sts/conf/catalina.propertiess and ensure that the
'package.access' line is configured as follows:


package.access=sun.,org.apache.catalina.,org.apache.coyote.,org.apache.jasper.,org.apache.tomcat.
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000141-WSR-000075'
  tag gid: nil
  tag rid: nil
  tag stig_id: 'VCPF-70-000011'
  tag fix_id: nil
  tag cci: 'CCI-000381'
  tag nist: ['CM-7 a']

  describe command("grep 'package.access' '#{input('catalinaPropertiesPath')}'") do
    its ('stdout.strip') { should eq "#{input('packageAccess')}" }
  end

end

