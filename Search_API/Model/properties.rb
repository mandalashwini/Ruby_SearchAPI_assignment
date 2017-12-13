class Properties
  @@i=1
  def initialize(result)
    @result=result
  end

  def getInfo
    link=[]
    whois_model=Whois_model.new
    @result.items.each do |item|
      link.push(item.link)
      print @@i,': '
      print "Title: ", item.title,"\nLink: ", item.link,"\n"
      @@i=@@i+1
    end
    link
  end
end