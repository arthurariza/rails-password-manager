# frozen_string_literal: true

class UserPassword < ApplicationRecord
  belongs_to :user
  belongs_to :password
end
