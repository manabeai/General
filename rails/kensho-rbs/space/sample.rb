class Foo
  @@class_variable = "class variable"

  def initialize
    @instance_variable = "instance variable"
  end

  def bar
    1 + 1
  end
end