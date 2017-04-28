class Address
attr_accessor :city, :state, :location


 def initialize city=nil, state=nil, point=nil
    @city=city
    @state=state
    @location=Point.demongoize(point)
 end

   def mongoize
  c={:city=>@city, :state=>@state, :loc=>Point.mongoize(@location)}
  end

   def self.demongoize object
    case object
    when nil then nil
    when Hash then 
      Address.new(object[:city],object[:state],object[:loc])
    else object
    end
    end

    def self.mongoize object
  	case object
    when Address then object.mongoize
    when nil then nil
    when Hash then 
       Address.new(object[:city],object[:state],object[:loc]).mongoize
    else object
    end
  	end


    def self.evolve input
	  if input.class == Address
 	 input.mongoize
   elsif input.nil?
    nil
 	 else
 	 input.to_h
  	end
  end




end