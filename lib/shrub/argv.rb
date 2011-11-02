module Shrub::Argv
  def flags
    @flags ||= select{|arg| arg[0] == '-'}.map do |arg|
      if arg[0..1] == '--'
        arg[2..-1]
      else
        arg[1..-1].split //
      end
    end.flatten
    return @flags
  end

  def args
    return @args ||= reject{|arg| arg[0] == '-'}
  end

  def flag?(flag)
    return flags.include? flag.to_s
  end

  def respond_to?(method_sym, include_private = false)
    if method_sym.to_s =~ /^flag_(.*)?$/
      return true
    else
      return super
    end
  end
  def method_missing(method_sym, *arguments, &block)
    if method_sym.to_s =~ /^flag_(.*)\?$/
      return flag? $1
    else
      super
    end
  end
end

ARGV.extend(Shrub::Argv)
