class AddDirectLeadEmailToLeads < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :direct_lead_email, :string
  end
end
