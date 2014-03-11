require 'spec_helper'

describe TabFileProcessor do

  describe '.process' do

    it 'returns the tab file rows as an array of arrays' do
      tab_file = File.open("#{Rails.root}/spec/fixtures/small_example.tab")
      expected_array = [["Bob Customer", "$5 for $1", "1.0", "1", "1234 Notaplace", "Teds Place"]]

      expect(TabFileProcessor.process(tab_file)).to eq(expected_array)
    end

  end

end
