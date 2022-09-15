require_relative "serializer"

class CommentSerializer < Serializer
 attr_writer :id
 attr_writer :body
end
