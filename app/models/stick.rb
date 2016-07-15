class Stick
  include ActiveModel::Model
  attr_accessor :wood_type, :color, :centimeters, :popsicle_id, :joke

  def initialize(stick_hash)
    stick_hash.each do |key, value|
      send("#{key}=", value) unless value.is_a? Hash
    end

    self.joke = Joke.new(stick_hash['joke'])
  end
  # t.string  "wood_type"
  # t.string  "color"
  # t.integer "centimeters"
  # t.integer "popsicle_id"
end
