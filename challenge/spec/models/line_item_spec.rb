require 'spec_helper'

describe LineItem do

  it { should belong_to(:purchaser) }
  it { should belong_to(:item) }

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

    describe "the line item's item" do

      context 'when the item does not already exist' do
        let(:line_item) { LineItem.new(item_description: "$2 for $1", item_price: 1.0) }

        it 'creates a new item' do
          expect {
            line_item.save
          }.to change{ Item.count }.by(1)
        end

        it 'assigns its item' do
          line_item.save
          expect(line_item.item).to eq(Item.where(description: "$2 for $1").first)
        end
      end

      context 'when the item does already exist' do
        let!(:item) { Item.create(description: "$10 for $5", price: 5.0) }
        let(:line_item) { LineItem.new(item_description: "$10 for $5", item_price: 5.0) }

        it 'does not create a new item' do
          expect {
            line_item.save
          }.to_not change{ Item.count }
        end

        it 'assigns its item' do
          line_item.save
          expect(line_item.item).to eq(item)
        end
      end
    end
  end
end
