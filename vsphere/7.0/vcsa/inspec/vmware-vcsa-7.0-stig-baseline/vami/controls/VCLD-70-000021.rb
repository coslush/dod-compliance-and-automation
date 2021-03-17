# encoding: UTF-8

control 'VCLD-70-000021' do
  title 'VAMI must not be configured to use mod_status.'
  desc  "Any application providing too much information in error logs and in
administrative messages to the screen risks compromising the data and security
of the application and system.

    VAMI must only generate error messages that provide information necessary
for corrective actions without revealing sensitive or potentially harmful
information in error logs and administrative messages. The mod_status module
generates the status overview of the webserver.

    The information covers:

    uptime
    average throughput
    current throughput
    active connections and their state

    While this information is useful on a development system, production
systems must not have mod_status enabled.
  "
  desc  'rationale', ''
  desc  'check', "
    At the command prompt, execute the following command:

    # /opt/vmware/sbin/vami-lighttpd -p -f
/opt/vmware/etc/lighttpd/lighttpd.conf 2>/dev/null|awk
'/server\\.modules/,/\\)/'|grep mod_status

    If any value is returned, this is a finding.
  "
  desc  'fix', "
    Navigate to and open /opt/vmware/etc/lighttpd/lighttpd.conf.

    Remove the line containing mod_status. The line may be in an included
config and not in the parent config itself.
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000266-WSR-000159'
  tag gid: nil
  tag rid: nil
  tag stig_id: 'VCLD-70-000021'
  tag fix_id: nil
  tag cci: 'CCI-001312'
  tag nist: ['SI-11 a']


  
end

