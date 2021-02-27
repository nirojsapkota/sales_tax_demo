# frozen_string_literal: true

require_relative '../utils/utility_functions'
require 'csv'
describe Utils::UtilityFunctions do
  let!(:dummy_class) { Class.new { include Utils::UtilityFunctions } }
  let!(:util_obj) { dummy_class.new }

  it 'should round float to nearest number 0.05' do
    ut = util_obj.round_to_nearest(23.74)
    expect(ut).to eq 23.75
  end

  it 'should format float to decimal places' do
    ut = util_obj.format_number(23.72787987)
    expect(ut).to eq 23.73
  end
end
