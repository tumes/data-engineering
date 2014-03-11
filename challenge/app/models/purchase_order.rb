class PurchaseOrder < ActiveRecord::Base

  has_many :line_items

  attr_writer :line_item_data

  before_create :create_line_items

  private

  def create_line_items
    @line_item_data ||= []

    @line_item_data.each do |li|
      LineItem.create(purchaser_name: li[0], item_description: li[1], item_price: li[2], purchase_count: li[3], merchant_address: li[4], merchant_name: li[5])
    end
  end

end
