class ErrorsController < ApplicationController
  def error_404
    flash.now[:alert] = "Page not found (#{params['code']})"
  end
end