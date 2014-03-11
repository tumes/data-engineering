require 'spec_helper'

describe LineItem do

  describe '.create' do

    context 'when all new data is present' do
      let(:purchase_order) { PurchaseOrder.create }
      let(:line_item) { LineItem.new(purchase_order: purchase_order, purchase_count: 2 ) }

      it "assigns its purchase order" do
        line_item.save
        expect(line_item.purchase_order).to eq(purchase_order)
      end

      it "saves its purchase count" do
        line_item.save
        expect(line_item.purchase_count).to eq(2)
      end

    end

  end

end
