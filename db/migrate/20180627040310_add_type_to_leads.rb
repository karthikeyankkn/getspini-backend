class AddTypeToLeads < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :type, :string
  end
end
