module GroupedAccessor
  def grouped_accessor(group, *names)
    names.each do |name|
      if name.is_a?(Hash)
        name.each{ |nom,aliased_by| make_grouped_accessor(group, nom, aliased_by) }
      else
        make_grouped_accessor(group, name)
      end
    end
  end

  def make_grouped_accessor(group, name, alias_by = nil)
    attr_accessor name
    alias_method(alias_by, name) if alias_by
    alias_method("#{alias_by}=", "#{name}=") if alias_by
    var_name = "@#{group}_group_accessor"
    class_eval <<-END_EVAL
      if #{var_name}
          #{var_name} << name
      else
        #{var_name} = [name]
      end
    END_EVAL
    class_eval <<-METHOD_DEF
      def #{group}
        self.class.accessors_grouped_by(#{group.inspect}).inject({}) { |h,attr| h[attr] = send(attr); h }
      end
    METHOD_DEF
  end

  def accessors_grouped_by(group)
    instance_variable_get("@#{group}_group_accessor")
  end

  # when a class is using grouped_accessor, we need to copy the groups to the child.
  # note that this limits the possibilities of reopening a parent class to add more grouped accessors
  def inherited(subclass)
    instance_variables.grep(/^@\w+_group_accessor$/) do |v|
      subclass.instance_variable_set(v, instance_variable_get(v).clone)
    end
    super
  end
end
