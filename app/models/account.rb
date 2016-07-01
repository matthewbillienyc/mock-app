# make an account class with the properties from the dummy hash

# you can use the same format as the other models except when it comes to setting the organization,
# you will create a new organization object with the organization's attributes, pretty tricky so don't hesitate
# to ask for help

class Account
  include ActiveModel::Model
  attr_accessor :employer, :account_number, :organization

  def initialize(input)
    @employer = input["employer"]
    @account_number = input["account_number"]
    @organization = Organization.new(input["organization"])
  end


end
