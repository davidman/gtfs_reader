module GtfsReader
  class Configuration

    # Creates simple configuration parameters which may be set by the user
    #@param names [Array<Symbol>] the names of the parameters to create
    def parameter(*names)
      names.each do |name|
        define_singleton_method name do |*values|
          value = values.first
          value ? instance_variable_set("@#{name}", value) : instance_variable_get("@#{name}")
        end
      end
    end

    def block_parameter(name, obj_class)
      obj = obj_class.new

      define_singleton_method name do |*args,&blk|
        obj.instance_eval( *args, &blk ) if blk
        obj
      end
    end
  end
end
