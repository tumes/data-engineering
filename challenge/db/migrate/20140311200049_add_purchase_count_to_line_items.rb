class AddPurchaseCountToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :purchase_count, :integer
  end
end
