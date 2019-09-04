class RepositoriesController < ApplicationController

  def index
   resp = Faraday.get("https://api.github.com/user") do |req|
   req.params['oauth_token'] = session[:token]
   # don't forget that pesky v param for versioning
   req.params['v'] = '20160201'
 end
 @user = JSON.parse(resp.body)["response"]["user"]["items"]
 render 'friends'
  end

end
