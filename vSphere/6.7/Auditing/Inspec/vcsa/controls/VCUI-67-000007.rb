control "VCUI-67-000007" do
  title "vSphere UI log files must only be accessible by privileged users."
  desc  "Log data is essential in the investigation of events. If log data were
to become compromised, then competent forensic analysis and discovery of the
true source of potentially malicious system activity would be difficult, if not
impossible, to achieve. In addition, access to log records provides information
an attacker could potentially use to their advantage since each event record
might contain communication ports, protocols, services, trust relationships,
user names, etc. The vSphere UI restricts all access to log file by default but
this configuration must be verified."
  impact CAT II
  tag severity: "CAT II"
  tag gtitle: "SRG-APP-000357-WSR-000150"
  tag gid: nil
  tag rid: "VCUI-67-000007"
  tag stig_id: "VCUI-67-000007"
  tag fix_id: nil
  tag cci: "CCI-001849"
  tag nist: ["AU-4", "Rev_4"]
  tag false_negatives: nil
  tag false_positives: nil
  tag documentable: nil
  tag mitigations: nil
  tag severity_override_guidance: nil
  tag potential_impacts: nil
  tag third_party_tools: nil
  tag mitigation_controls: nil
  tag responsibility: nil
  tag ia_controls: "AU-4"
  tag check: "At the command prompt, execute the following command:

# find /storage/log/vmware/vsphere-ui/logs/ -xdev -type f -a '(' -not -perm 600
-o -not -user vsphere-ui ')' -exec ls -ld {} \\;

If any files are returned, this is a finding."
  tag fix: "At the command prompt, execute the following commands:

# chmod 600 /storage/log/vmware/vsphere-ui/logs/<file>
# chown vsphere-ui:users /storage/log/vmware/vsphere-ui/logs/<file>

Note: Subsitute <file> with the listed file"
end
