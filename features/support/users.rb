include Warden::Test::Helpers

After do |scenario|
  Warden.test_reset!
end

def test_user
  @test_user = @test_user || FactoryGirl.create(:user)
end

def admin_user
  @admin_user = @admin_user || FactoryGirl.create(:admin)
end

def sign_in_as_test_user
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
end


def sign_out_all
  logout
end

def populate_users
  @users = []
  10.times do
    @users << FactoryGirl.create(:user)
  end
  # ('A'..'Z').each do |last_name|
  #   @users << User.create!(
  #     :email => "#{last_name}@railsbookcheckout.com",
  #     :firstname => 'Erica',
  #     :lastname => last_name,
  #     :password => 'p455w0rd'
  #   )
  # end
  @users
end
