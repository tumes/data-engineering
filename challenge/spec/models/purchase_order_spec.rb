require 'spec_helper'

describe PurchaseOrder do

  it { should have_many(:line_items) }

  describe '.create' do
    let(:line_item_data_1) { ["Guy Customer", "$5 for $2.50", "2.50", "2", "1234 Street Pl", "Item Barn"] }
    let(:line_item_data_2) { ["Polly Customer", "$8 for $4", "4", "1", "1234 Place St", "Stuff Gazebo"] }
    let(:purchase_order) { PurchaseOrder.new(line_item_data: [line_item_data_1, line_item_data_2]) }

    it 'creates a line item for each chunk of data passed in' do
      expect(LineItem).to receive(:create).twice
      purchase_order.save
    end
  end

end
