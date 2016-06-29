class User
  include ActiveModel::Model
  attr_accessor :name

  def initialize(user_hash)
    user_hash.each do |key, value|
      send("#{key}=", value)
    end
  end
end