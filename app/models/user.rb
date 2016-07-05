class User
  include ActiveModel::Model
  attr_accessor :first_name, :last_name

  def initialize(user_hash)
    user_hash.each do |key, value|
      send("#{key}=", value)
    end
  end

  def name
    self.first_name + " " + self.last_name
  end
end
