# frozen_string_literal: true

module Utils
  # Utility functions for number formatting
  module UtilityFunctions
    require 'csv'
    # round to nearest 0.05
    # algorithm used
    # round(x / precision)) * precision
    def round_to_nearest(val)
      (val * 20).round / 20.0
    end

    def format_number(float)
      (float * 100).round / 100.0
    end
  end
end
