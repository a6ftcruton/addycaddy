#class ApiRequests
#  @queue = :send_request
#  # any class method perform is a resque job
#  def self.perform
#    
#  end
#  # can I enqueue a method that is being called/used by multiple objects e.g.
#  # can I move FourSquare.send_request into app/jobs
#  # or should I have the start method from Query and enqueue that?
#  #
#  # how do I use the redis server from my VPS?
#end
