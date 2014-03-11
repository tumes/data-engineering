require 'spec_helper'

describe LineItem do

  it { should belong_to(:purchaser) }

  describe '.create' do

    describe 'the base line item' do
      let(:purchase_order) { PurchaseOrder.create }
      let(:line_item) { LineItem.new(purchase_order: purchase_order, purchase_count: 2) }

      it "assigns its purchase order" do
        line_item.save
        expect(line_item.purchase_order).to eq(purchase_order)
      end

      it "saves its purchase count" do
        line_item.save
        expect(line_item.purchase_count).to eq(2)
      end
    end

    describe "the line item's purchaser" do

      context 'when the purchaser does not already exist' do
        let(:line_item) { LineItem.new(purchaser_name: "Bob Customer") }

        it 'creates a new purchaser' do
          expect {
            line_item.save
          }.to change{ Purchaser.count }.by(1)
        end

        it 'assigns its purchaser' do
          line_item.save
          expect(line_item.purchaser).to eq(Purchaser.where(name: "Bob Customer").first)
        end
      end

      context 'when the purchaser does already exist' do
        let!(:purchaser) { Purchaser.create(name: "Bob Customer") }
        let(:line_item) { LineItem.new(purchaser_name: "Bob Customer") }

        it 'does not create a new purchaser' do
          expect {
            line_item.save
          }.to_not change{ Purchaser.count }
        end

        it 'assigns its purchaser' do
          line_item.save
          expect(line_item.purchaser).to eq(purchaser)
        end
      end
    end
  end
end
