class ImageFile < ActiveRecord::Base

  include HttpUtils

  has_one :file_object, :as => :derived_file

  after_initialize :create_file_object

  def initialize(attributes=nil, options={})
    @file = attributes
    super
  end

  def create_file_object
    # upload file to parse
    response = parsedotcom_http('post_file', {
        :data => @file[:data],
        :name => @file[:name],
        :type => File.extname(@file[:name])
    })
    puts response
    # create new FileObject and set url
    @file_object = FileObject.create({
      :url => response['url'],
      :name => response['name'],
      :size => @file[:size]
    })
  end

end
