class LineItem < ActiveRecord::Base
  belongs_to :purchase_order
  belongs_to :purchaser
  belongs_to :item

  attr_writer :purchaser_name, :item_description, :item_price

  before_create :assign_purchaser, :assign_item

  private

  def assign_purchaser
    self.purchaser = Purchaser.where(name: @purchaser_name).first_or_create
  end

  def assign_item
    self.item = Item.where(description: @item_description).first_or_create
  end

end
