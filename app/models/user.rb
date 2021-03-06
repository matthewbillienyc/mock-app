class User
  include ActiveModel::Model
  attr_accessor :first_name, :last_name, :email, :password, :password_confirmation, :role

  def initialize(user_hash)
    user_hash.each do |key, value|
      send("#{key}=", value)
    end
  end

  def name
    "#{first_name} #{last_name}"
  end

  def admin?
    role == 'admin'
  end
end
