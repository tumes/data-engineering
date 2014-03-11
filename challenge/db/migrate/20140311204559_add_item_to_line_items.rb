class AddItemToLineItems < ActiveRecord::Migration
  def change
    add_reference :line_items, :item, index: true
  end
end
