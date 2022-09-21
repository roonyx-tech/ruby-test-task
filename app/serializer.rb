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
end