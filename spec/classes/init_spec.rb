require 'spec_helper'
describe 'byod_fact' do
  context 'with default values for all parameters' do
    it { should contain_class('byod_fact') }
  end
end
