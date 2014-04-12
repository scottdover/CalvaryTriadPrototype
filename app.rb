class CalvaryApp < Sinatra::Base
  get '/:layout/:file' do
    haml params[:file].to_sym, 
      :layout => params[:layout].to_sym,
      :locals => {:file => params[:file]}
  end
end