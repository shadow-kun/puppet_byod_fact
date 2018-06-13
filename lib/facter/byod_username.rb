Facter.add('byod_username') do
  setcode do
    # detect OS Family
    osfamily = Facter.value(:osfamily)
    case osfamily
      when 'windows'
        # When windows, read the registry for value
        #confine :osfamily => :windows
        begin
          value = nil
          Win32::Registry::HKEY_LOCAL_MACHINE.open('SOFTWARE\Puppet Labs\CustomFacts') do |regkey|
            value = regkey['byod_username']
          end
          value
        rescue
          nil
        end
      when 'Darwin'
        begin
          value = nil
          string = Facter::Util::Resolution.exec('defaults read puppet_byod "BYOD_Username"')
          end
          value
        rescue
          nil
        end
      else
        # when other OS, do nothing
        value = nil
    end
  end
end
