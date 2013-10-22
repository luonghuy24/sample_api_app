class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token
  def data
    directory = "public"
    File.open(File.join(directory, 'data.txt'), 'a+') do |f|
      f.write("#{DateTime.now} - #{params.to_s}")
    end
    render text: 'ok', status: 200
  end
end
