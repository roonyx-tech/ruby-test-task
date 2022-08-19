class Serializer
  @@object_attributes ||= {}
  @@object ||= []

  def initialize(object)
    @@object = object
    @serialize_hash = @@object_attributes[self.class]

    serializer_filler()
  end

  def serialize()
    @serialize_hash
  end

  class << self
    def attribute(value, &block)
      @@object_attributes[self] ||= {}

      if block_given?
        @@object_attributes[self][value] = block
      else
        @@object_attributes[self][value] = nil
      end 
    end

    def object()
      @@object
    end
  end
  

  private

    def serializer_filler()
      @serialize_hash.each do |key, value|
        if value
          @serialize_hash[key] = value.call()
        else
          @serialize_hash[key] = @@object.send(key)
        end
      end
    end
end
