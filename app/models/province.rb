class Province < ApplicationRecord
  has_and_belongs_to_many :taxes
end
