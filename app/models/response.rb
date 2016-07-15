class Response
  include ActiveModel::Model
  attr_accessor :rating, :response_text

  def initialize(response_hash)
    response_hash.each do |key, value|
      send("#{key}=", value) unless value.is_a? Hash
    end
  end
end
