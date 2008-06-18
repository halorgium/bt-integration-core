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
    var_name = "@@#{group}_group_accessor"
    class_eval <<-END_EVAL
      if defined? #{var_name}
          #{var_name} << name
      else
        #{var_name} = [name]
      end
    END_EVAL
    class_eval "def #{group}; h = {}; #{var_name}.each { |attr| h[attr] = send(attr) }; h; end"
  end
end
