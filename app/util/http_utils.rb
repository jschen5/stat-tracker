module HttpUtils

  require 'parse-ruby-client'
  require 'open-uri'

  # command names
  POST_FILE = 'post_file'

  # urls
  POST_FILE_URL = 'https://api.parse.com/1/files/'

  # map of commands to url
  PARSE_COMMANDS = {
    POST_FILE => POST_FILE_URL
  }

  # map of img extensions to format
  FILE_TYPES = {
    ".jpg" => "image/jpeg",
    ".jpeg"=> "image/jpeg",
    ".png" => "image/png"
  }

  # Parse.com keys
  APP_ID = 'KCJCNHUsGQSMCzYDSHwNs4UutbtfMAvt7nZRINgY'
  REST_API_KEY = '4Y6jqJVd7KyTdGwv15Gik2M3xyYuUt0osgofyyjo'
  Parse.init :application_id => APP_ID,
             :api_key        => REST_API_KEY

  # handles all requests to Parse.com
  def parsedotcom_http(command, params={})

    # url, filename still needs to be appended
    url = URI.parse(PARSE_COMMANDS[command])

    # POST file
    if command == POST_FILE
      parse_file = Parse::File.new({
          :body => params[:data],
          :local_filename => URI::encode(params[:name]),
          :content_type => FILE_TYPES[params[:type]]
      })
      parse_file.save
    end

  end

end