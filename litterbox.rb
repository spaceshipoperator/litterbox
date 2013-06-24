#!/usr/bin/ruby

require 'sinatra'
require 'haml'

get '/' do
  puts "hi ya!"
  haml :app
end

# ty SO: http://stackoverflow.com/a/5134590
post '/upload' do
  unless params[:file] &&
    (tmpfile = params[:file][:tempfile]) &&
    (name = params[:file][:filename])
    @error = "No file selected"
    return haml(:upload)
  end
  STDERR.puts "Uploading file, original name #{name.inspect}"
  while blk = tmpfile.read(65536)
    # here you would write it to its final location
    STDERR.puts blk.inspect
  end
  "Upload complete"
end

__END__

@@app
%h3 foo you
%form{:action=>"/upload", :method=>"post" ,:enctype=>"multipart/form-data"}
  %input{:type=>"file", :name=>"file"}
  %input{:type=>"submit", :value=>"Upload"}
