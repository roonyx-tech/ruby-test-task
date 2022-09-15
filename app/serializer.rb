class Serializer
    attr_writer :id
    attr_writer :title
    attr_writer :body
    attr_writer :date
    
  def initialize(option = {})
  self.id = option[:id]

  begin
    self.body = option[:body]
  rescue
    # Ignored
  end

  begin
    self.title = option[:title]
  rescue
    # Ignored
  end

  begin
    self.date = option[:date].strftime("%d-%m-%Y")
  rescue
    # Ignored
  end
end

def serialize
    if self.class.name == 'PostSerializer'
      {
        id: @id,
        title: @title,
        date: @date,
      }
    else
      {
        id: @id,
        body: @body
      }
    end

  end

end
