class EntityClassException < StandardError
  def initialize(class_name = nil)
    super("Couldn't create an instance of the class #{class_name}, NoMethodError has been raised.")
  end
end
