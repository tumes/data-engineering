class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :purchase_order, index: true

      t.timestamps
    end
  end
end
