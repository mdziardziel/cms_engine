desc "Create admin user"
namespace :cms_engine do
  task create_admin: :environment do
    puts 'Creating an admin user...'
    puts "Provide email:\n"
    STDOUT.flush
    email_input = STDIN.gets.chomp

    puts "Provide name:\n"
    STDOUT.flush
    name_input = STDIN.gets.chomp

    puts "Provide password:\n"
    STDOUT.flush
    password_input = STDIN.gets.chomp

    user = CmsEngine::User.create(email: email_input, name: name_input, password: password_input)

    if user.present?
      puts "Admin with email #{email_input} successfully created!"
    else
      puts 'Something went wrong, please try again.'
    end
  end
end
