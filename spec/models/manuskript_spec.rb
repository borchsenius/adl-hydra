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


    @article.datastreams.keys.should include("relations")
    @article.rightsMetadata.should be_kind_of Hydra::Datastream::RelsExtDatastream
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