require 'delegate'

module Torch::Argv
  def flags
    @flags ||= Flags.new(self)
    return @flags
  end

  def args
    return @args ||= reject{|arg| arg[0,1] == '-'}
  end

  def [](flag, *rest)
    if rest.empty? and (flag.is_a? String or flag.is_a? Symbol) 
      i = flag_index flag.to_s
      return nil unless i
      return nil if self[i+1][0,1] == '-'
      return self[i+1]
    else
      super
    end
  end

  private
  def flag_index(flag)
    if flag.size > 1
      return index "--#{flag}"
    elsif flag.size == 1
      return index{|arg| arg =~ /^-[^-]*#{flag}[^-]*$/}
    end
  end
end

class Torch::Argv::Flags < Delegator
  def initialize(argv)
    @argv = argv
    super
  end

  def include?(flag)
    return super(flag.to_s)
  end

  def __setobj__(obj) # We don't allow this
  end

  def __getobj__
    @flags ||= @argv.select{|arg| arg[0,1] == '-'}.map do |arg|
      if arg[0..1] == '--'
        arg[2..-1]
      else
        arg[1..-1].split(//)
      end
    end.flatten
    return @flags
  end

  def respond_to?(method_sym, include_private = false)
    if method_sym.to_s =~ /^_([a-zA-Z0-9_]+)\?$/
      return true
    else
      return super
    end
  end
  def method_missing(method_sym, *arguments, &block)
    if method_sym.to_s =~ /^_([a-zA-Z0-9_]+)\?$/
      return include? $1
    else
      super
    end
  end
end

ARGV.extend(Torch::Argv)
