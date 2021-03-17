# encoding: UTF-8

control 'VCLD-70-000018' do
  title "VAMI must protect against or limit the effects of HTTP types of Denial
of Service (DoS) attacks."
  desc  "In UNIX and related computer operating systems, a file descriptor is
an indicator used to access a file or other input/output resource, such as a
pipe or network connection. File descriptors index into a per-process file
descriptor table maintained by the kernel, that in turn indexes into a
system-wide table of files opened by all processes, called the file table.

    As a single-threaded server, Lighttpd must be limited in the number of file
descriptors that can be allocated.  This will prevent Lighttpd from being used
in a form of DoS attack against the Operating System.
  "
  desc  'rationale', ''
  desc  'check', "
    At the command prompt, execute the following command:

    # /opt/vmware/sbin/vami-lighttpd -p -f
/opt/vmware/etc/lighttpd/lighttpd.conf 2>/dev/null|grep \"server.max-fds\"|sed
's: ::g'

    Expected result:

    server.max-fds=2048

    If the output does not match the expected result, this is a finding.
  "
  desc  'fix', "
    Navigate to and open /opt/vmware/etc/lighttpd/lighttpd.conf

    Add or reconfigure the following value:

    server.max-fds = 2048
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000246-WSR-000149'
  tag gid: nil
  tag rid: nil
  tag stig_id: 'VCLD-70-000018'
  tag fix_id: nil
  tag cci: 'CCI-001094'
  tag nist: ['SC-5 (1)']

  runtime = command("#{input('lighttpdBin')} -p -f #{input('lighttpdConf')}").stdout

  describe parse_config(runtime).params['server.max-fds'] do
    it { should cmp "#{input('maxFds')}" }
  end

end

