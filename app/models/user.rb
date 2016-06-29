class User
  include ActiveModel::Model
  attr_accessor :name

  def initialize(user_hash)
    send("#{key}=", value)
  end
end