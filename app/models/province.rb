class Province < ApplicationRecord
  has_and_belongs_to_many :taxes
  belongs_to :address
end
