class ApplicationController < ActionController::Base
 def addition 
  render({ :template => "something_templates/addition.html.erb"})
 end

 def addition_result

  @no_1 = params.fetch("number_one")
  @no_2 = params.fetch("number_two")

  @sum = @no_1.to_f + @no_2.to_f

  render({ :template => "something_templates/addition_result.html.erb"})
 end
 
 def subtract
  render({ :template => "something_templates/subtraction.html.erb"})
 end

 def subtract_result

  @no_1 = params.fetch("number_one")
  @no_2 = params.fetch("number_two")

  @result = @no_2.to_f - @no_1.to_f
  
  render({ :template => "something_templates/subtraction_result.html.erb"})
 end

  def multiply 
  render({ :template => "something_templates/multiply.html.erb"})
 end

 def multiply_result

  @no_1 = params.fetch("number_one")
  @no_2 = params.fetch("number_two")

  @result = @no_2.to_f * @no_1.to_f
  
  render({ :template => "something_templates/multiply_result.html.erb"})
 end

  def divide 
  render({ :template => "something_templates/divide.html.erb"})
 end


 def divide_result

  @no_1 = params.fetch("number_one")
  @no_2 = params.fetch("number_two")

  @result = @no_1.to_f / @no_2.to_f
  
  render({ :template => "something_templates/divide_result.html.erb"})
 end

end