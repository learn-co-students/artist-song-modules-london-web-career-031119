module Findable
  def find_by_name(name)
    # self.all here refers to the class related to the method.
   self.all.detect {|a| a.name == name}
 end

end
