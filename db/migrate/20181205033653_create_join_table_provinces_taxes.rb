class CreateJoinTableProvincesTaxes < ActiveRecord::Migration[5.2]
  def change
    create_join_table :provinces, :taxes do |t|
      # t.index [:province_id, :tax_id]
      # t.index [:tax_id, :province_id]
    end
  end
end
