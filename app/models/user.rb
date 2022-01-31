class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable

  delegated_type :userable, types: %w[Employee Customer]
end

module Userable
  extend ActiveSupport::Concern

  included do
    has_one :user, as: :userable, touch: true
  end
end

class Employee < User
  include Userable
end

class Customer < User
  include Userable
end