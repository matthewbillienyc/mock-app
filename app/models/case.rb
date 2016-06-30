class Case
  include ActiveModel::Model
  attr_accessor :description, :user_id

  def initialize(case_hash)
    case_hash.each do |key, value|
      send("#{key}=", value)
    end
  end
end
