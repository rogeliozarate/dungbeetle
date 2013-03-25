require 'sinatra'
require "sinatra/reloader" if development?
require 'haml'


get "/" do
  haml :index
end

post "/" do
   file = params['upload']
   File.open("./public/uploads/#{file[:filename]}", "w") { |f| f.write file[:tempfile].read }
   "#{file[:filename]} uploaded"
end

__END__
@@index
!!!5
%html
  %head
    %title Sinatra File Upload
  %body
    %form(method="post" enctype="multipart/form-data")
      %input(type="file" name="upload")
      %input(type="submit" value="Upload")
