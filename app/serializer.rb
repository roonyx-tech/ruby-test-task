
class Serializer

  attr_accessor :values
  def initialize(attr)
    self.values = attr
  end
  def self.attribute(*args)
    @attr = args unless args.empty?
  end
  def serialize
      values.date = values.date.strftime("%d-%m-%Y") unless values.instance_of?(Comment)
      hash_values = values.to_h
      hash_values.delete(:title) unless values.instance_of?(Post)
      hash_values
    end
end