# frozen_string_literal: true

require_relative '../utils/utility_functions'
require 'csv'

# Product class
class Product
  include Utils::UtilityFunctions

  attr_accessor :name, :product_detail, :tax

  SALES_TAX = 10.to_f
  IMPORT_DUTY = 5.to_f
  EXCLUDED_FOR_SALES_TAX = %w[book food medical].freeze
  ITEMS_LIST_FILE_PATH = File.join(File.dirname(__FILE__), '../utils/items.csv')

  def initialize(name, quantity = 1)
    @name = name.downcase
    @quantity = quantity.to_i
    @product_detail = _get_product(name)
    @tax = tax_amount
  end

  def tax_amount
    tax = 0.0

    tax += (_total_before_tax * SALES_TAX / 100) unless EXCLUDED_FOR_SALES_TAX.include?(product_detail['category'])

    tax += (_total_before_tax * IMPORT_DUTY / 100) if product_detail['imported'] == 'true'

    round_to_nearest(tax)
  end

  def total_price
    format_number(_total_before_tax + tax)
  end

  def output
    [@quantity, name, total_price].join(',')
  end

  private

  def _total_before_tax
    @quantity * product_detail['price'].to_f
  end

  def _get_product(name)
    @csv ||= CSV.read(ITEMS_LIST_FILE_PATH, headers: true)
    @csv.find { |row| row['product'].downcase == name.downcase }
  end
end
