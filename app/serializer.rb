class Serializer
  attr_accessor :data

  def initialize(attribute)
    self.data = attribute
  end

  def self.attribute(*args)
    @attribute = args unless args.empty?
    @attribute
  end
end
