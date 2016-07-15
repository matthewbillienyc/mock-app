class PopsicleSummary
  include ActiveModel::Model
  attr_accessor :serial_number, :flavor, :joke_funniess, :stick_wood_type, :company_name

  def initialize(summary_hash)
    summary_hash.each do |key, value|
      send("#{key}=", value)
    end
  end
end
