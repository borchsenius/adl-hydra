# GenericContent:  EXAMPLE Model that conforms to the Hydra genericContent and genericMetadata cModels
class Manuskript < ActiveFedora::Base
  include Hydra::GenericContent
  include Hydra::ModelMethods

  # Uses the Hydra Rights Metadata Schema for tracking access permissions & copyright
  has_metadata :name => "rightsMetadata", :type => Hydra::RightsMetadata

  # Uses the GenericContent mixin to conform to the Hydra genericContent cModel


  has_metadata :name => "descMetadata", :type => ManuskriptTeiDatastream

  delegate :title, :to=>"descMetadata", :unique=>"true"
  delegate :abstract, :to=>"descMetadata", :unique=>"true"

  # A place to put extra metadata values, e.g. the user id of the object depositor (for permissions)
  #has_metadata :name => "properties", :type => Hydra::Datastream::Properties

  #has_metadata :name => "relations", :type => Hydra::Datastream::RelsExtDatastream


  # adds helpful methods for basic hydra objects.
  # FIXME:  redundate with  GenericContent include above??

  def initialize( attrs={} )
    super
  end
end
