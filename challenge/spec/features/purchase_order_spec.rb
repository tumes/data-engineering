require 'spec_helper'

describe 'uploading a purchase order tab file' do

  it 'allows a user to upload a tab file, and displays the result' do
    visit '/'
    click_link 'Process a purchase order tab file'

    attach_file 'purchase_order_tab_file', "#{Rails.root}/spec/fixtures/example_input.tab"
    click_button 'Process Tab File'

    expect(current_path).to eq('/')
    expect(page).to have_text '$95.0'
  end

end
