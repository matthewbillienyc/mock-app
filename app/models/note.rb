class Note
  include ActiveModel::Model
  attr_accessor :text, :popsicle_serial_number, :importance

  def initialize(note_hash)
    note_hash.each do |k, v|
      send("#{k}=", v) unless v.is_a? Hash
    end
  end
end
