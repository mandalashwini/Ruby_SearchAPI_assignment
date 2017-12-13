require_relative '../Model/api_Adapter'
require_relative '../Model/whois_model'
require_relative '../Model/properties'
require_relative '../Model/logger'
require 'benchmark'

module Controller
  def self.start_controller
    i=0
    first=0
    value=1
    increment=10
    print "Enter search key: \n"
    key=gets.chomp
    api_adapter=Api_model.new
    #puts Benchmark.measure {
    for  value in [1,11,21,31,41]
      i=0
      api_adapter.getKey(key,value)
      result=api_adapter.search_Key
       if result.queries.request[first]["totalResults"]!= 0
        property=Properties.new(result)
        link_array=property.getInfo
        whois_model=Whois_model.new
        domain_array=whois_model.get_domain(link_array)
       # domain_array
        created_date= whois_model.domain_created(domain_array)
        #puts created_date
        updated_date= whois_model.domain_updated(domain_array)
        #puts updated_date
        domain_id= whois_model.domain_id(domain_array)
        #puts domain_id
        domain_array.each do |domain|
          Logger.instance.custom_log(link_array[i],domain,created_date[i],updated_date[i],domain_id[i])
          i=i+1
        end
      value=value+increment
       end
    end
  #  }
  end
end






Controller.start_controller