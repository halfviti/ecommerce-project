# frozen_string_literal: true

module ProductsHelper
  def filter_options
    filters = []
    filters << ['No Filter', '']
    filters << ['New Products', 'new']
    filters << ['Recently Updated', 'updated']
    filters
  end
end
