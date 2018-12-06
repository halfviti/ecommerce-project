# frozen_string_literal: true

ActiveAdmin.register Province do
  permit_params :province, tax_ids: []

  form do |f|
    f.inputs 'Province' do
      f.input :province
      f.input :tax_ids, as: :select, collection: Tax.all, :label_method => :rate, input_html: { multiple: true }
    end
    f.actions
  end

  show do
    attributes_table do
      row :province
      row :taxes do |province|
        province.taxes.order(:order)
                .map { |tax| link_to "#{tax.name}: #{tax.rate}", admin_tax_path(tax) }
                .join('<br />').html_safe
      end
    end
  end
end
