class PurchaseOrdersController < ApplicationController
  respond_to :html

  def new
    @purchase_order = PurchaseOrder.new
  end

  def create
    line_item_data = TabFileProcessor.process(params[:purchase_order][:tab_file].tempfile)
    @purchase_order = PurchaseOrder.new(line_item_data: line_item_data)
    @purchase_order.save

    respond_with @purchase_order, location: root_path
  end

  def index
    @purchase_orders = PurchaseOrder.all
  end
end
