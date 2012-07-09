# == Schema Information
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  email               :string(255)     default(""), not null
#  encrypted_password  :string(255)     default(""), not null
#  remember_created_at :datetime
#  sign_in_count       :integer         default(0)
#  current_sign_in_at  :datetime
#  last_sign_in_at     :datetime
#  current_sign_in_ip  :string(255)
#  last_sign_in_ip     :string(255)
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#  username            :string(255)
#  admin               :boolean         default(FALSE)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable, :recoverable,
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :username, :email, :password, :password_confirmation, :remember_me, :admin

  attr_accessor :login

  has_many :subscriptions, dependent: :destroy

  has_one :cart, dependent: :destroy

  has_many :authentications, dependent: :destroy

  validates :username, presence: true, length: {in: 2..30}, uniqueness: { case_sensitive: false } 

  validates :email, presence: true, email_format: {message: 'is not correct'}

  def add_to_cart edition_id
    container_item = cart.container_items.find_by_edition_id(edition_id)
    if container_item
      container_item.quantity += 1
    else
      container_item = cart.container_items.build(edition_id: edition_id)
    end
    container_item
  end

  def delete_from_cart container_item_id
    container_item = cart.container_items.find(container_item_id)
    if container_item.quantity > 1
      container_item.quantity -= 1
      container_item.save
    else
      container_item.destroy
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { value: login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def apply_omniauth omniauth
    authentications.build provider: omniauth[:provider], uid: omniauth[:uid]
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

end

