class MathFunctions::Servicefunction < MathFunctions::Base

  def parser(z)
  eval(self.name.gsub(/x/,"#{z}"))
  end

  def function(x, a=1, b=1, h=0, k=0)
    a * parser(b*(x-h)) + k
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
