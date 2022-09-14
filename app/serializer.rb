# frozen_string_literal: true

# Serializer for required response
class Serializer
  class << self
    attr_reader :attributes

    def attribute(attribute, &block)
      @attributes ||= {}
      @attributes[attribute] = block
    end
  end

  attr_reader :object

  def initialize(object)
    @object = object
  end

  def serialize
    serialized_data = {}

    self.class.attributes.each do |attribute, block|
      serialized_data[attribute] = object.send(attribute)
      serialized_data[attribute] = instance_eval(&block) unless block.nil?
    end

    serialized_data.compact
  end
end
