class ApplicationController < ActionController::Base
    def set_pagination_params
        params[:page] = params[:page].to_i.positive? ? params[:page] : 1
    end
end
