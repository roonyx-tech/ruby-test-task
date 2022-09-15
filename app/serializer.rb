class Serializer
    attribute :id
    attribute :title
    attribute :body
    attribute :date
    
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
