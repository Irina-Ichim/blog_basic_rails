class HomeController < ApplicationController

    def index
      render html: "<h1>Hello, World!</h1>".html_safe
    end
  
     def getquerystringvalues
      message=" "
      if params[:message]
        message+="<h1>Message is : " + params[:message] + "</h1>"
      else
        message+="<h1>Yoy havent supplied any value for message..</h1>"
      end
      if params[:country]
        message+="<h1>Country is : " + params[:country] + "</h1>"
      else
        message+="<h1>Yoy havent supplied any value for country..</h1>"
      end
      render html: message.html_safe
    end
  
    def passdatatoviews
       message=" <h1>Hola Irina</h1>"
       message+="<h2>Hola Irina</h2>"
       message+="<h3>Hola Irina</h3>"
      message+="<h4>Hola Irina</h4>"
      message+="<h5>Hola Irina</h5>"
      message+="<h6>Hola Irina</h6>"
   render html: message.html_safe
    end
  end