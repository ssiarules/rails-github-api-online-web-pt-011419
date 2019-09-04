class RepositoriesController < ApplicationController

  def index
   resp = Faraday.get("https://api.github.com/user") do |req|
   req.params['oauth_token'] = session[:token]
 end
 @user = JSON.parse(resp.body)["response"]["user"]["items"]
 render 'root_path'
  end

end
