# Class: byod_fact
# ===========================
#
# Reads custom facts that identify who's device
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'byod_fact':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Daniel Johnson <shadowreaper@shadowreaper.net>
#
# Copyright
# ---------
#
# Copyright 2018 Daniel Johnson.
#
class puppet_byod_fact {
  Factor.add('byod_username') do
    confine :osfamily => :windows
    setcode do
      begin
        value = nil
        Win32::Registry::HKEY_LOCAL_MACHINE.open('SOFTWARE\Puppet Labs\CustomFacts') do |regkey|
          value = regkey['BYOD_Username']
        end
          value
        rescue
          nil
        end
    end
  end
}
