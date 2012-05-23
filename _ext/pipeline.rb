Awestruct::Extensions::Pipeline.new do
  extension Awestruct::Extensions::DataDir.new
  # extension Awestruct::Extensions::Posts.new( '/news' ) 
  extension Awestruct::Extensions::Indexifier.new
  extension Awestruct::Extensions::Flattr.new
  extension Awestruct::Extensions::Disqus.new
  helper Awestruct::Extensions::GoogleAnalytics
end