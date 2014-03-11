class PurchaseOrder < ActiveRecord::Base

  has_many :line_items

end
