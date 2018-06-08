Factor.add('byod_username') do
   confine :osfamily => :windows
   setcode do
     begin
        value = nil
        Win32::Registry::HKEY_LOCAL_MACHINE.open('SOFTWARE\Puppet Labs\CustomFacts') do |regkey|
        value
       rescue
          nil
        end
    end
end
