require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "validations" do
    describe "username" do
      it "requires a username" do
        user = User.new(email: "hobo@wufer.com", password: "test1234")
        expect(user.save).to be(false)
      end

      it "requires that the username is unique" do
        user = User.new(username: "hobowufer", email: "hobo@wufer.com", password: "test1234")
        expect(user.save).to be(true)

        bad_user = User.new(username: "hobowufer", email: "hobo@woofer.com", password: "test1234")
        expect(bad_user.save).to be(false)
      end

      it "only allows certain characters"

    end

    describe "email" do
      it "requires an email" do
        user = User.new(username: "hobowufer", password: "test1234")
        expect(user.save).to be(false)
      end

      # Because Devise enforces uniqueness on email by default
      # it "can use existing emails" do
      #   user = User.new(username: "hobowufer", email: "hobo@wufer.com", password: "test1234")
      #   expect(user.save).to be(true)
      #
      #   bad_user = User.new(username: "linktothepast", email: "hobo@wufer.com", password: "test1234")
      #   expect(bad_user.save).to be(true)
      # end
    end
  end
end
