class LineItem < ActiveRecord::Base
  belongs_to :purchase_order
  belongs_to :purchaser

  attr_writer :purchaser_name

  before_create :assign_purchaser

  private

  def assign_purchaser
    self.purchaser = Purchaser.where(name: @purchaser_name).first_or_create
  end

end
