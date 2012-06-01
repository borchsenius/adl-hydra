# spec/datastreams/journal_article_mods_datastream_spec.rb
require 'spec_helper'


#logger = Logger.new(STDOUT)


describe ManuskriptTeiDatastream do
  before(:each) do
#    logger.info("JournalArticleModsDatastream SPEC  START")
    @mods = fixture("article_mods_sample.xml")
    @ds = JournalArticleModsDatastream.from_xml(@mods)
 #   logger.info("JournalArticleModsDatastream SPEC  HAR INDLAEST")

  end
  it "should expose bibliographic info for journal articles with explicit terms and simple proxies" do
    @ds.mods.title_info.main_title.should == ["SAMPLE ARTICLE TITLE"]
    @ds.title.should == ["SAMPLE ARTICLE TITLE"]
    @ds.abstract.should == ["THIS IS AN ABSTRACT"]
    @ds.journal.title_info.main_title.should == ["SAMPLE HOST JOURNAL TITLE"]
    @ds.journal_title.should == ["SAMPLE HOST JOURNAL TITLE"]
    @ds.journal.issue.date.should == ["FEB. 2007"]
    @ds.publication_date.should == ["FEB. 2007"]
    @ds.journal.issue.volume.number.should == ["2"]
    @ds.journal_volume.should == ["2"]
    @ds.journal.issue.level.number.should == ["18"]
    @ds.journal_issue.should == ["18"]
    @ds.journal.issue.pages.start.should == ["195"]
    @ds.start_page.should == ["195"]
    @ds.journal.issue.pages.end.should == ["230"]
    @ds.end_page.should == ["230"]
  end


  it "should expose nested/hierarchical metadata" do
    @ds.author.first_name.should == ["George","Abraham"]
    @ds.author.last_name.should == ["Washington", "Lincoln"]
    @ds.author.role.text.should == ["Creator", "Contributor"]
    @ds.author(0).first_name.should == ["George"]
    @ds.author(0).last_name.should == ["Washington"]
    @ds.author(0).role.text.should == ["Creator"]
  end
end