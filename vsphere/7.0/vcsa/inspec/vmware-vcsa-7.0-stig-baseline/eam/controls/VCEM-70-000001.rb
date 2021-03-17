# encoding: UTF-8

control 'VCEM-70-000001' do
  title "ESX Agent Manager must limit the amount of time that each TCP
connection is kept alive."
  desc  "Denial of Service is one threat against web servers.  Many DoS attacks
attempt to consume web server resources in such a way that no more resources
are available to satisfy legitimate requests.

    In Tomcat, the 'connectionTimeout' attribute sets the number of
milliseconds the server will wait after accepting a connection for the request
URI line to be presented. This timeout will also be used when reading the
request body (if any). This prevents idle sockets that are not sending HTTP
requests from consuming system resources and potentially denying new
connections.
  "
  desc  'rationale', ''
  desc  'check', "
    At the command prompt, execute the following command:

    # xmllint --xpath '/Server/Service/Connector/@connectionTimeout'
/usr/lib/vmware-eam/web/conf/server.xml

    Expected result:

    connectionTimeout=\"60000\"

    If the output does not match the expected result, this is a finding.
  "
  desc  'fix', "
    Navigate to and open /usr/lib/vmware-eam/web/conf/server.xml

    Configure the <Connector> node with the value:

    connectionTimeout=\"60000\"
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000001-WSR-000001'
  tag gid: nil
  tag rid: nil
  tag stig_id: 'VCEM-70-000001'
  tag fix_id: nil
  tag cci: 'CCI-000054'
  tag nist: ['AC-10']

  begin
    xmlconf = xml("#{input('serverXmlPath')}")

      if xmlconf['Server/Service/Connector/attribute::connectionTimeout'].is_a?(Array)
        xmlconf['Server/Service/Connector/attribute::connectionTimeout'].each do |x|
          describe x do
            it { should eq "#{input('connectionTimeout')}" }
          end
        end
      else
        describe xml(xmlconf['Server/Service/Connector/attribute::connectionTimeout']) do
          it { should eq "#{input('connectionTimeout')}" }
        end
      end
  end
  
end

