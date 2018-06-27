class AddBudgetAmountToLeads < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :budget_amount, :string
  end
end
