class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)

    elsif req.path.match(/cart/) && @@cart.size == 0
      resp.write "Your cart is empty"

    elsif req.path.match(/cart/) && @@cart.size > 0
      @@cart.each do |cart_item|
        resp.write "#{cart_item}\n"
      end

    elsif req.path.match(/add/)
      search_term = req.params["item"]
      resp.write handle_add(search_term)
      
    else
      resp.write "Path Not Found"
    end
    resp.finish
  end

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end

  def handle_add(search_term)
    if @@items.include?(search_term)
      @@cart << "#{search_term}"
      return "added #{search_term}"
    else 
      return "We don't have that item"
    end
  end

end






































#=======================================================

# if req.path.match(/cart/)
#       @@cart.each do |cart_item|
#         resp.write "#{cart_item}\n"
#       end
#     elsif @@cart.size == 0 
#       resp.write "Your cart is empty"
#     end


# if req.path.match(/cart/)
    #   @@cart.each do |cart_item|
    #     resp.write "#{cart_item}\n"
    #   end
    # elsif @@cart.size == 0 
    #   resp.write "Your cart is empty"
    # end




    # @@items.each do |item|
    #   resp.write "#{item}\n"



  # elsif @@cart.include?(search_term)
  #   resp.write "#{search_term}\n"



# "Path Not Found"

#==================================================================
# class Application

#   @@items = ["Apples","Carrots","Pears"]

#   def call(env)
#     resp = Rack::Response.new
#     req = Rack::Request.new(env)

#     if req.path.match(/items/)
#       @@items.each do |item|
#         resp.write "#{item}\n"
#       end
#     elsif req.path.match(/search/)
#       search_term = req.params["q"]
#       resp.write handle_search(search_term)
#     else
#       resp.write "Path Not Found"
#     end

#     resp.finish
#   end

#   def handle_search(search_term)
#     if @@items.include?(search_term)
#       return "#{search_term} is one of our items"
#     else
#       return "Couldn't find #{search_term}"
#     end
#   end
# end