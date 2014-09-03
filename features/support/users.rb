include Warden::Test::Helpers

def test_user
  @test_user = @test_user || FactoryGirl.create(:user)
end

def admin_user
  @admin_user = @admin_user || FactoryGirl.create(:admin)
end

def sign_in_as_test_user
  # user = FactoryGirl.build :user
  # @test_user = @test_user || User.where("email == '#{user.email}'").first || user
  # @test_user.save!

  # login_as @test_user, :scope => :user
  # @test_user
  sign_in_as :user
end

def sign_in_as_admin
  sign_in_as :admin
end

def sign_in_as name
  user = FactoryGirl.build name
  inst_var = "@#{name}_user"

  instance_variable_set(inst_var, User.where("email == '#{user.email}'").first || FactoryGirl.create(name))
  login_as instance_variable_get(inst_var), :scope => :user
  instance_variable_get(inst_var)
  # @admin_user = @admin_user || User.where("email == '#{admin.email}'").first || FactoryGirl.create(name)
  # login_as @admin_user, :scope => :user
  # @admin_user
end


def sign_out_all
  Warden.test_reset!
end

# login actions for browser sign ins

# def browser_sign_in_as_user
#   user = FactoryGirl.attributes_for :user
#   email = user.email
#   pass = user.password
#   test_user  # create user

# end
