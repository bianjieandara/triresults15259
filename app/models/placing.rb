class Placing

attr_accessor :name, :place


 def initialize name, place
    @name=name
    @place=place

 end

   def mongoize
  c={:name=>@name, :place=>@place}
  end

   def self.demongoize object
    case object
    when nil then nil
    when Hash then 
      Placing.new(object[:name],object[:place])
    else object
    end
    end

    def self.mongoize object
  	case object
    when Placing then object.mongoize
    when nil then nil
    when Hash then 
       Placing.new(object[:name],object[:place]).mongoize
    else object
    end
  	end


    def self.evolve input
	  if input.class == Placing
 	  input.mongoize
      elsif input.nil?
      nil
 	  else
 	  input.to_h
  	  end
    end


end