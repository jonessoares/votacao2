class Campaign < ApplicationRecord
  #Para utilizar o Active Storage basta adicionar attached ao model
  has_one_attached :image  #*****
  
  belongs_to :user
  has_many :likes
 
  validates_presence_of :title, :description
 
  before_update :is_blocked
 
  private
  
  # verifica se a campanha está bloqueada e aborta o update da Campaing
  def is_blocked
    campaign = Campaign.find(self.id)
    if campaign.blocked
      throw(:abort)    #Lancar exececao
    end
  end
 
end