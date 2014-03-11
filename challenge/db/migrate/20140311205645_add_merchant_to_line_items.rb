class AddMerchantToLineItems < ActiveRecord::Migration
  def change
    add_reference :line_items, :merchant, index: true
  end
end
