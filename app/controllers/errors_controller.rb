class ErrorsController < ApplicationController
  def error_404
    flash.now[:alert] = "#{t('page_not_found')} (#{params['code']})"
  end
end