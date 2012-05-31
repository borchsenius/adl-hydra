# app/models/journal_article.rb
# a Fedora object for the Journal Article hydra content type

# app/models/journal_article.rb
# a Fedora object for the Journal Article hydra content type
class JournalArticle < ActiveFedora::Base
  include Hydra::ModelMethods

  has_metadata :name => "descMetadata", :type=> JournalArticleModsDatastream
  has_metadata :name => "rightsMetadata", :type => Hydra::RightsMetadata



  # Uses the Hydra MODS Article profile for tracking most of the descriptive metadata
 # has_metadata :name => "descMetadata", :type => Hydra::ModsArticle


  #  # The delegate method allows you to set up attributes on the model that are stored in datastreams
  #  # When you set :unique=>"true", searches will return a single value instead of an array.
    delegate :title, :to=>"descMetadata", :unique=>"true"
    delegate :abstract, :to=>"descMetadata", :unique=>"true"

    delegate :start_page, :to=>"descMetadata"
    delegate :end_page, :to=>"descMetadata"
    delegate :publication_date, :to=>"descMetadata"


  # A place to put extra metadata values
  has_metadata :name => "properties", :type => ActiveFedora::MetadataDatastream do |m|
    m.field 'collection', :string
    m.field 'depositor', :string
  end

end
#
#class JournalArticle < ActiveFedora::Base
#  include Hydra::ModelMethods
#
#  has_metadata :name => "rightsMetadata", :type => Hydra::Datastream::RightsMetadata
#  has_metadata :name => "descMetadata", :type => JournalArticleModsDatastream
#
#  #has_metadata :name => "descMetadata", :type => JournalArticleModsDatastream
#
#  #has_metadata :name => "descMetadata", :type => Hydra::Datastream::AdlHydra::JournalArticleModsDatastream
#
#
#  # The delegate method allows you to set up attributes on the model that are stored in datastreams
#  # When you set :unique=>"true", searches will return a single value instead of an array.
#  delegate :title, :to=>"descMetadata", :unique=>"true"
#  delegate :abstract, :to=>"descMetadata", :unique=>"true"
#
#  delegate :start_page, :to=>"descMetadata"
#  delegate :end_page, :to=>"descMetadata"
#  delegate :publication_date, :to=>"descMetadata"
#  delegate :journal_title, :to=>"descMetadata"
#  delegate :journal_volume, :to=>"descMetadata"
#  delegate :journal_issue, :to=>"descMetadata"
#  print "JournalArticle STOP"
#
#
#  def minheltegenmetode (titled)
#    print "frokost " +titled
#  end
#
#  def initialize( attrs={} )
#    print "JournalArticle initialize"
#    super
#  end
#
#end