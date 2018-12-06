# frozen_string_literal: true

class Province < ApplicationRecord
  has_and_belongs_to_many :taxes, join_table: :provinces_taxes
  accepts_nested_attributes_for :taxes, allow_destroy: true
end
