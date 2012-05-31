require 'spec_helper'

describe JournalArticle do

  before(:each) do
    # This gives you a test article object that can be used in any of the tests
    @article = JournalArticle.new
  end

  it "should have the specified datastreams" do
    # Check for descMetadata datastream with MODS in it
    @article.datastreams.keys.should include("descMetadata")
    @article.descMetadata.should be_kind_of Hydra::ModsArticle

    #JournalArticleModsDatastream
    # Check for rightsMetadata datastream
    @article.datastreams.keys.should include("rightsMetadata")
    @article.rightsMetadata.should be_kind_of Hydra::RightsMetadata
  end

  it "should have the attributes of a journal article and support update_attributes" do
    attributes_hash = {
        "title" => "All the Awesome you can Handle",
        "abstract" => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        "journal_title" => "The Journal of Cool",
        "publication_date" => "1967-11-01",
        "journal_volume" => "3",
        "journal_issue" => "2",
        "start_page" => "25",
        "end_page" => "30",
    }

    @article.update_attributes( attributes_hash )

    # These attributes have been marked "unique" in the call to delegate, which causes the results to be singular
    @article.title.should == attributes_hash["title"]
    @article.abstract.should == attributes_hash["abstract"]

    # These attributes have not been marked "unique" in the call to the delegate, which causes the results to be arrays
    @article.journal_title.should == [attributes_hash["journal_title"]]
    @article.publication_date.should == [attributes_hash["publication_date"]]
    @article.journal_volume.should == [attributes_hash["journal_volume"]]
    @article.journal_issue.should == [attributes_hash["journal_issue"]]
    @article.start_page.should == [attributes_hash["start_page"]]
    @article.end_page.should == [attributes_hash["end_page"]]
  end

  # it "should handle trees/hierarchies of author info" do
  #   attributes_hash = {
  #     "author" => [
  #       {"first_name" => "Dude",
  #         "last_name" => "Radical",
  #         "role" => "author"},
  #       {"first_name" => "Chris",
  #         "last_name" => "McCollaborator",
  #         "role" => "contributor"}
  #       ]
  #   }
  #   @article.update_attributes( attributes_hash )
  #   
  #   @article.author(0).first_name.should == "Dude"
  #   @article.author(0).last_name.should == "Radical"
  #   @article.author(0).role.should == "author"
  #   
  #   @article.author(1).first_name.should == "Chris"
  #   @article.author(1).last_name.should == "McCollaborator"
  #   @article.author(1).role.should == "contributor"
  # end
  # 
  # it "should have the methods from Hydra::ModelMethods" do
  #   JournalArticle.included_modules.should include(Hydra::ModelMethods)
  #   @article.should respond_to(:apply_depositor_metadata)
  #   @article.should respond_to(:destroyable_child_assets)
  # end
end