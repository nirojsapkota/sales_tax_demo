# frozen_string_literal: true

require 'csv'
require_relative '../app/product'

describe Product do
  let(:obj) { described_class.new('Bottle of perfume', 1) }

  it 'properly initializes the Product' do
    expect(obj).to be_a described_class
    expect(obj.name).to eq 'bottle of perfume'
    expect(obj.product_detail).to be_a CSV::Row
  end

  it 'gets calculates calculate_tax correctly' do
    expect(obj.tax_amount).to eq 1.9
  end

  it 'gets total_price for the item' do
    expect(obj.total_price).to eq 20.89
  end

  it 'outputs the item details' do
    expect(obj.output).to eq '1,bottle of perfume,20.89'
  end
end
