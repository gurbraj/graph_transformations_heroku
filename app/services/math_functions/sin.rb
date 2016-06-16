class MathFunctions::Sin < MathFunctions::Base


  def function(x, a=1, b=1, h=0, k=0)
    a * Math.sin(b*(x-h)) + k
  end

  def y_vals(a=1,b=1,h=0,k=0)
    @a=a
    @b=b
    @h=h
    @k=k

    x_vals.map do |x|
      function(x,a=@a,b=@b,h=@h,k=@k)
    end
  end




end
