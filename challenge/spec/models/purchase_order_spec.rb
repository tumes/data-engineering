require 'spec_helper'

describe PurchaseOrder do

  it { should have_many(:line_items) }

end
