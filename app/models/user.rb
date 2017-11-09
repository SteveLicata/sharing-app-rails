class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # acts_as_messageable

  def name
    return "You should add method :name in your Messageable model"
  end

  def mailboxer_email(object)
    #Check if an email should be sent for that object
    #if true
    return "define_email@on_your.model"
    #if false
    #return nil
  end

  #paperclip
  has_attached_file :avatar,
    :styles => { :medium => "300x300px>", :thumb => "100x100px>" },
    :default_url => "/assets/default-user-image copy.png"

  validates_attachment_content_type :avatar,
    :content_type => /\Aimage\/.*\Z/

  #associations
  has_many :posts


end
