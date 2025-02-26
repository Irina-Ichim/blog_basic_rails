class HomeController < ApplicationController
  def index
    render html: "<h1>Hello, World!</h1>".html_safe
  end

  def getquerystringvalues
    message = ""

    message << if params[:message].present?
                 "<h1>Message is: #{params[:message]}</h1>"
               else
                 "<h1>You haven't supplied any value for message..</h1>"
               end

    message << if params[:country].present?
                 "<h1>Country is: #{params[:country]}</h1>"
               else
                 "<h1>You haven't supplied any value for country..</h1>"
               end

    render html: message.html_safe
  end

  def passdatatoviews
    @messages = (1..6).map { |i| "Hola Irina" }
  end

  def showdatatimeinfo
    @current_time = DateTime.now
    render "home/showdatatimeinfo"
  end

  def conditionalrendering
    @data = {
      name: "Irina",
      isVisible: true,
      loggedIn: false,
      countryCode: "US",
      workExperience: 5,
      stateCode: nil
    }
  end
  
  def loop_through_arrays
    @products = [
      { id: 1, name: "Laptop", quantity: 5, discontinued: false, stock: 20, cost: 1000 },
      { id: 2, name: "Mouse", quantity: 10, discontinued: false, stock: 50, cost: 20 },
      { id: 3, name: "Keyboard", quantity: 8, discontinued: true, stock: 0, cost: 40 }
    ]
  end
end

