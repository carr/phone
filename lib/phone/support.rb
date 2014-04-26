require 'yaml'
# support methods to remove dependencies on ActiveSupport
class String
  def present?
    !blank?
  end

  def blank?
    if respond_to?(:empty?) && respond_to?(:strip)
      empty? or strip.empty?
    elsif respond_to?(:empty?)
      empty?
    else
      !self
    end
  end
end

class Hash
  alias_method :blank?, :empty?

  def present?
    !blank?
  end
end

class Object
  def present?
    self.class!=NilClass
  end
end

class NilClass #:nodoc:
  def blank?
    true
  end

  def present?
    false
  end
end
