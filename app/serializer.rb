class Serializer
  attr_accessor :data

  def initialize(attribute)
    self.data = attribute
  end

  def self.attribute(*args)
    @attribute = args unless args.empty?
    @attribute
  end

  def serialize
    data.date = data.date.strftime("%d-%m-%Y") unless data.instance_of?(Comment)
    hash_values = data.to_h
    hash_values.delete(:title) unless data.instance_of?(Post)
    hash_values
  end
end
