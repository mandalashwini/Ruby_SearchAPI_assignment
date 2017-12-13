require_relative '../config/initializers/google_cse_api'

module Google
  def self.search_Key(key,value)
    begin
      results = GoogleCustomSearchApi.search(key,start: value)
      results
    end
  end
end

