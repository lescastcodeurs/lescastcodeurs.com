require 'bootstrap-sass'
require 'atomizer_custom'

Awestruct::Extensions::Pipeline.new do
  extension Awestruct::Extensions::DataDir.new
  extension Awestruct::Extensions::Posts.new('', :posts)
  extension Awestruct::Extensions::Paginator.new( :posts, '/index', :per_page=>10 )
  extension Awestruct::Extensions::Indexifier.new
  extension Awestruct::Extensions::Atomizer.new( 
    :posts, 
    '/feed.atom', 
    :num_entries=>10000,
    :content_url=>'http://lescastcodeurs.com',
    :feed_title=> 'Les Cast Codeurs Podcast' )
  extension Awestruct::Extensions::Flattr.new
  extension Awestruct::Extensions::Disqus.new
  helper Awestruct::Extensions::GoogleAnalytics
end