# == Schema Information
#
# Table name: languages_users
#
#  user_id     :integer          not null
#  language_id :integer          not null
#
# Indexes
#
#  index_languages_users_on_user_id_and_language_id  (user_id,language_id) UNIQUE
#

require 'test_helper'

class LanguagesUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
