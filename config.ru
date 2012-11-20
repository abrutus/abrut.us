require 'bundler/setup'
require 'sinatra/base'
require 'rack-rewrite'

# The project root directory
$root = ::File.dirname(__FILE__)

#rewrite rules
use Rack::Rewrite do
	r301 %r{^/blog/2012/10/25/bliss-that-is-out-of-reach/?$}, 'http://blog.andrebrutus.com/2012/10/25/bliss-that-is-out-of-reach/'
	r301 %r{^/blog/2012/10/28/job-sins-from-the-youth/?$}, 'http://blog.andrebrutus.com/2012/10/28/job-sins-from-the-youth/'
	r301 %r{^/blog/2012/11/03/chronicles-of-a-bittersweet-travel-experience/?$}, 'http://blog.andrebrutus.com/2012/11/03/chronicles-of-a-bittersweet-travel-experience/'
	r301 %r{^/blog/2012/10/24/quote-from-job-2/?$}, 'http://blog.andrebrutus.com/2012/10/04/quote-from-job-2/'
end
class SinatraStaticServer < Sinatra::Base  

  get(/.+/) do
    send_sinatra_file(request.path) {404}
  end

  not_found do
    send_sinatra_file('404.html') {"Sorry, I cannot find #{request.path}"}
  end

  def send_sinatra_file(path, &missing_file_block)
    file_path = File.join(File.dirname(__FILE__), 'public',  path)
    file_path = File.join(file_path, 'index.html') unless file_path =~ /\.[a-z]+$/i  
    File.exist?(file_path) ? send_file(file_path) : missing_file_block.call
  end

end

run SinatraStaticServer
