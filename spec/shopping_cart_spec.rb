# frozen_string_literal: true

require 'csv'
require_relative '../app/shopping_cart'

describe ShoppingCart do
  let(:obj) { described_class.new }

  describe '#InstanceMethods ' do
    it 'properly initializes the Product' do
      expect(obj).to be_a described_class
      expect(obj.total_items).to be_empty
    end

    it 'adds new item' do
      obj.add_items('Bottle of perfume', 1)
    end

    it 'prints output' do
      obj.add_items('Bottle of perfume', 1)
      expect { obj.output }.to output(/Total: 20.89/).to_stdout
    end
  end

  describe 'Testing Inputs' do
    context "when input 1 is passed"
    it 'outputs the 1st input' do
      obj.add_items('book', 1)
      obj.add_items('music CD', 1)
      obj.add_items('chocolate bar', 1)
      expect { obj.output }.to output(/Total: 29.83/).to_stdout
    end
  end

  context "when input 2 is passed" do
    it 'outputs the 2nd input' do
      obj.add_items('imported box of chocolates', 1)
      obj.add_items('imported bottle of perfume', 1)
      expect { obj.output }.to output(/Total: 65.15/).to_stdout
    end
  end

  context "when input 3 is passed" do
    it 'outputs the 3rd input' do
      obj.add_items('imported bottle of perfume', 1)
      obj.add_items('bottle of perfume', 1)
      obj.add_items('packet of headache pills', 1)
      obj.add_items('box of imported chocolates', 1)
      expect { obj.output }.to output(/Total: 98.09/).to_stdout
    end
  end
end
