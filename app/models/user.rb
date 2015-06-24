class User < ActiveRecord::Base
  before_validation :default_name, if: :name_blank?

  validates :name, presence: true
  validates :email, presence: true

  has_many :messages
  attr_accessor :full_name

  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:github]

  def self.from_omniauth_github(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider    = auth.provider
      user.uid         = auth.uid
      user.name        = auth.info.nickname
      user.email       = auth.info.email
      user.git_api_url = auth.extra.raw_info.url
      user.password    = Devise.friendly_token[0,20]
    end
  end


  def calculations
    self.full_name = "#{name} #{email}"
  end

  private
  def default_name
    self.name = 'Anonim'
  end

  def name_blank?
    name.blank?
  end

end
