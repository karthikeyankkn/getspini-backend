class RenameTypeInLeads < ActiveRecord::Migration[5.2]
  def change
  	rename_column :leads, :type, :source
  end
end
