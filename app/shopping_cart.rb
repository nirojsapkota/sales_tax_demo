# frozen_string_literal: true

require_relative 'product'
# Shopping cart class
# Add/remove and output the receipt
class ShoppingCart
  attr_accessor :total_items

  def initialize
    @total_items = []
  end

  def items
    total_items
  end

  def add_items(name, quantity)
    total_items << Product.new(name.downcase, quantity)
  end

  def output
    sales_tax = 0.0
    total = 0.0

    @total_items.each do |i|
      puts i.output
      sales_tax += i.tax_amount
      total += i.total_price
    end

    puts "Sales Taxes: #{format('%.2f', sales_tax)}"
    puts "Total: #{format('%.2f', total)}"
  end
end
