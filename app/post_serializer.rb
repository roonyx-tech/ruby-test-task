require_relative "serializer"

class PostSerializer < Serializer
  attr_writer :id
  attr_writer :title
  attr_writer :date do
    object.date.strftime("%d-%m-%Y")
  end
end
