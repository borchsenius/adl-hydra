# app/models/datastreams/journal_article_mods_datastream.rb

# a Fedora Datastream object containing Mods XML for the descMetadata 
# datastream in the Journal Article hydra content type, defined using 
# ActiveFedora and OM.

class JournalArticleModsDatastream < ActiveFedora::NokogiriDatastream


  # OM (Opinionated Metadata) terminology mapping for the mods xml
  set_terminology do |t|
    print "start set terminology JournalArticleModsDatastream"
    t.root(:path=>"mods", :xmlns=>"http://www.loc.gov/mods/v3", :schema=>"http://www.loc.gov/standards/mods/v3/mods-3-2.xsd")
    t.title_info(:path=>"titleInfo") {
      t.main_title(:index_as=>[:facetable],:path=>"title", :label=>"title")
    }
    t.author(:path=>"name", :attributes=>{:type=>"personal"}) {
      t.first_name(:path=>"namePart", :attributes=>{:type=>"given"})
      t.last_name(:path=>"namePart", :attributes=>{:type=>"family"})
      t.role {
        t.text(:path=>"roleTerm",:attributes=>{:type=>"text"})
      }
    }
    t.abstract
    t.journal(:path=>'relatedItem', :attributes=>{:type=>"host"}) {
      t.title_info(:ref=>[:title_info])
      t.issue(:path=>"part") {
        t.volume(:path=>"detail", :attributes=>{:type=>"volume"}) {
          t.number
        }
        t.level(:path=>"detail", :attributes=>{:type=>"level"}) {
          t.number
        }
        t.pages(:path=>"extent", :attributes=>{:unit=>"pages"}) {
          t.start
          t.end
        }
        t.date
      }
    }

    # these proxy declarations allow you to use more familiar term/field names that hide the details of the XML structure
    t.title(:proxy=>[:mods, :title_info, :main_title])
    t.journal_title(:proxy=>[:journal, :title_info, :main_title])
    t.journal_volume(:proxy=>[:journal, :issue, :volume, :number])
    t.journal_issue(:proxy=>[:journal, :issue, :level, :number])
    t.start_page(:proxy=>[:journal, :issue, :pages, :start])
    t.end_page(:proxy=>[:journal, :issue, :pages, :end])
    t.publication_date(:proxy=>[:journal, :issue, :date])

  end # set_terminology

  def self.xml_template
    return Hydra::ModsArticle.xml_template
  end


end # class