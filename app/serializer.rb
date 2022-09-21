class Serializer
  # class variables 
  @@attributes ||= {}
  @@object ||= []

  class << self
    # define attribute in post and comment file
    def attribute(value, &block)
      @@attributes[self] ||= {}
      @@attributes[self][value] = block_given? ? block : nil
    end
    
    ## for date time we calling strf so object is declared here
    def object
      @@object
    end
  end

  ## Initializer defined
  def initialize(object)
    ## Struct object when post or comment new call
    @@object = object
    
    ## to get current class attributes
    @data_hash = @@attributes[self.class]
    
    ## call json 
    display_result
  end

  ## call rspec serilize method
  def serialize
    ## call from spec method
    @data_hash
  end

  def display_result
    @data_hash.each{|key, value| @data_hash[key] = value ? value.call() : @@object.send(key)}
  end
end