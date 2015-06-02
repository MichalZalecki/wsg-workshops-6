class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  has_many :messages

  attr_accessor :full_name

  devise :database_authenticatable, :registerable, :recoverable, :trackable, :validatable

  before_validation :default_name, if: :name_blank?

  def calculations
    self.full_name = "#{name} #{email}"
  end

  private
  def default_name
    self.name = "Anonim"
  end

  def name_blank?
    name.blank?
  end

end
