class AddPurchaserToLineItems < ActiveRecord::Migration
  def change
    add_reference :line_items, :purchaser, index: true
  end
end
