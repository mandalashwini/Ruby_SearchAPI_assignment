
class Logger

  def initialize
    @log = File.open("log.txt", "ab")
  end

  @@instance = Logger.new

  def self.instance
    return @@instance
  end

  def custom_log(link,domain,created,updated,domain_id)
    @log.print(link,"\t",domain,"\t",created,"\t",updated,"\t", domain_id,"\n")
  end

  private_class_method :new

end