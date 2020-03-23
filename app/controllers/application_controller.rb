class ApplicationController < ActionController::Base
    #   before_action :move_to_index, except: :index
    # def move_to_index
    # redirect_to controller: :products, action: :index unless user_signed_in?
    # end
    private
    def after_sign_in_path_for(resource)
      products_path
    end
    
    def after_sign_out_path_for(resource)
      root_path
    end
    

    
    
end
