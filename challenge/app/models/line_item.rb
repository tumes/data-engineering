class LineItem < ActiveRecord::Base
  belongs_to :purchase_order
  belongs_to :purchaser
  belongs_to :item
  belongs_to :merchant

  attr_writer :purchaser_name, :item_description, :item_price,
    :merchant_name, :merchant_address

  before_create :assign_purchaser, :assign_item, :assign_merchant

  def total_price
    purchase_count * item.price
  end

  private

  def assign_purchaser
    self.purchaser = Purchaser.where(name: @purchaser_name).first_or_create
  end

  def assign_item
    self.item = Item.where(description: @item_description, price: @item_price).first_or_create
  end

  def assign_merchant
    self.merchant = Merchant.where(name: @merchant_name, address: @merchant_address).first_or_create
  end

end
