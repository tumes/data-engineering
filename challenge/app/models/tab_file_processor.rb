class TabFileProcessor
  require 'csv'

  # This method takes a tab delimited file, disregards the headers, and
  # returns an array of arrays that represent the rows of provided data.
  def self.process(tab_file)
    data = CSV.read(tab_file, { :col_sep => "\t" })
    # Disregard the header
    data.tap(&:shift)
  end

end
