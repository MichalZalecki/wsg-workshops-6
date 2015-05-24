class User < ActiveRecord::Base
  validates :name, presence: true
  has_many :messages

  devise :database_authenticatable, :registerable, :recoverable, :trackable, :validatable

  before_validation :default_name, if: :name_blank?

  private
  def default_name
    self.name = "Anonim"
  end

  def name_blank?
    name.blank?
  end

end
