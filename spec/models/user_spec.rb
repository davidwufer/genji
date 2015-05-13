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
    end

    describe "email" do
      it "requires an email" do
      end

      it "can use existing emails" do
      end
    end
  end
end
