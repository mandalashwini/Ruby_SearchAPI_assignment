require 'whois'
require 'whois-parser'
require 'whois/parser/registrar'
require 'domainatrix'

class Whois_model

  def get_domain(link_array)
    url_list=[]
    link_array.each do |link|
      url = Domainatrix.parse(link)
      url= url.domain+'.'+url.public_suffix
      url_list.push(url)
    end
    url_list
  end

  def domain_created(url_array)
    output=[]
    old_url=nil
    r=nil
    w=Whois::Client.new
      url_array.each do |url|
        if url == old_url
          output.push(r)
        else
        parser=w.lookup(url).parser
            r=parser.created_on
            output.push(r)
        old_url=url
        end
      end
    sleep(0.1)
    return output
  end

  def domain_id(url_array)
    output=[]
    old_url=nil
    r=nil
    w=Whois::Client.new
    url_array.each do |url|
      if url == old_url
        output.push(r)
      else
        parser=w.lookup(url).parser
        r=parser.domain_id
        output.push(r)
        old_url=url
      end
    end
    return output
  end


  def domain_updated(url_array)
    output=[]
    old_url=nil
    r=nil
    url_array.each do |url|
      if url == old_url
        output.push(r)
      else
        parser=Whois.lookup(url).parser
            r=parser.updated_on
            output.push(r)
        old_url=url
      end
    end
    sleep(0.1)
    return output
  end
end


