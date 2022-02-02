

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable,
         # devise-jwt
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
         
  delegated_type :userable, types: %w[Employee Customer]

end

module Userable
  extend ActiveSupport::Concern

  included do
    has_one :user, as: :userable, touch: true
  end
end

class Employee < ApplicationRecord
  include Userable
  belongs_to :role
  has_many :permissions, through: :role
end

class Customer < ApplicationRecord
  include Userable
end
