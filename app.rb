require 'sinatra'
require "sinatra/reloader" if development?
require 'haml'
require 'sinatra/flash'

enable  :sessions

get "/" do
  flash[:notice] = "Your file has been uploaded"
  haml :index
end

post "/" do
   file = params['upload']
   File.open("./public/uploads/#{file[:filename]}", "w") { |f| f.write file[:tempfile].read }
   redirect '/'
end

__END__
@@index
!!!5
%html
  %head
    %title 
      [dungbeetle] Simple sinatra file uploader
  %body
    =styled_flash
    %form(method="post" enctype="multipart/form-data")
      %input(type="file" name="upload")
      %input(type="submit" value="Upload")
