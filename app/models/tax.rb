class Tax < ApplicationRecord
  has_and_belongs_to_many :provinces, join_table: :provinces_taxes

  def display_name
    "#{name}: #{rate}"
  end
end
