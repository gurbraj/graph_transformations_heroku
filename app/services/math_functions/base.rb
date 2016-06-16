class MathFunctions::Base
  attr_accessor :x_vals, :name

  def initialize(start,stop, name)
    @x_vals = (start..stop).to_a.map{|x| x*0.5}
    @name=name
  end



  def function
    raise "please override me"
  end

  def calculate

  end


end
