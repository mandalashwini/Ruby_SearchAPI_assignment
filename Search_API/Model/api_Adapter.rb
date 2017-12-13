require_relative 'google_API'

class Api_model
  module Adapter
  include Google
  end

  def search_Key
    self.adapter.search_Key(@key,@value)
  end

  def adapter
    return @adapter if @adapter
    self.adapter = :Google
    @adapter
  end

  def adapter=(adapter)
    @adapter = Api_model::Adapter.const_get(adapter.to_s.capitalize)
  end

  def getKey(key,value)
    @key=key
    @value=value
  end
end



