require 'spec_helper'
describe 'puppet_byod_fact' do
  context 'with default values for all parameters' do
    it { should contain_class('puppet_byod_fact') }
  end
end
