class Joke
  include ActiveModel::Model
  attr_accessor :question, :punchline, :dirtiness, :funniness, :author

  # t.string  "question"
  # t.string  "punchline"
  # t.integer "dirtiness"
  # t.integer "funniness"
  # t.string  "author"
  # t.integer "stick_id"

  def initialize(joke_hash)
    joke_hash.each do |key, value|
      send("#{key}=", value) unless value.is_a? Hash
    end
  end
end
