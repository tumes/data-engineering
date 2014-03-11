class ChangePrecisionAndScaleOnItems < ActiveRecord::Migration
  def change
    change_column :items, :price, :decimal, :precision => 8, :scale => 2
  end
end
