class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :city
      t.string :category
      t.string :direct_lead_name
      t.string :direct_lead_number
      t.string :referal_lead_name
      t.string :referal_lead_number

      t.timestamps
    end
  end
end
