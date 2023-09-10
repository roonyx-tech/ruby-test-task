# frozen_string_literal: true

class Serializer
  @@attributes = {}

  class << self
    def attribute(key, &block)
      attributes[key] = block_given? ? block : nil
    end

    def attributes
      @@attributes[to_s] ||= {}
    end

    def object
      @@object
    end
  end

  def initialize(object)
    @@object = object
  end

  def serialize
    serialized_data = {}

    attributes.each do |key, value|
      serialized_data[key] = value ? value.call : object.send(key)
    end
    serialized_data
  end

  def object
    @@object
  end

  def attributes
    @@attributes[self.class.to_s]
  end
end
