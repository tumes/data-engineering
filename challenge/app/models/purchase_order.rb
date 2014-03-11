class PurchaseOrder < ActiveRecord::Base

  has_many :line_items

  attr_writer :line_item_data, :tab_file

  after_create :create_line_items

  def total_price
    line_items.reduce(0){ |sum, li| li.total_price + sum }
  end

  private

  def create_line_items
    @line_item_data ||= []

    # The line item data is fed to this method as an array of arrays that
    # describe a split row of a tab-delimited file.
    @line_item_data.each do |li|
      LineItem.create(purchase_order: self, purchaser_name: li[0], item_description: li[1], item_price: li[2], purchase_count: li[3], merchant_address: li[4], merchant_name: li[5])
    end
  end

end
