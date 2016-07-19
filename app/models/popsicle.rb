class Popsicle
  include ActiveModel::Model
  attr_accessor :serial_number, :flavor, :color, :rating, :shape, :stick, :company, :status, :response

  def initialize(popsicle_hash)
    popsicle_hash.each do |key, value|
      send("#{key}=", value) unless value.is_a? Hash
    end

    self.stick = Stick.new(popsicle_hash['stick'])
    self.company = Company.new(popsicle_hash['company'])
    self.response = Response.new(popsicle_hash['response'])
  end
end

# Now you'll have to make stick.rb and do the same thing! Except stick's own joke's, so youll set self.joke = Joke.new
# TODO: create joke.rb, stick.rb, company.rb with appropriate attr_accessor methods and an initialize method that
# sets up any nested hashes
