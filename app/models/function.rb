class Function < ActiveRecord::Base

  def parser(z)


  eval(self.name.gsub(/x/,"#{z}"))
  end

  


end
