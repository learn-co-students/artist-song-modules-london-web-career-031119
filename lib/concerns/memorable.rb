# module Memorable

# def initialize
#     self.class.all << self
# end

# def reset_all
# all.clear
# end

# def count
# all.count
# end

# end
module Memorable
    module ClassMethods
      def reset_all
        self.all.clear
      end
  
      def count
        self.all.count
      end
    end
  
    module InstanceMethods
      def initialize
        self.class.all << self
      end
    end
  end