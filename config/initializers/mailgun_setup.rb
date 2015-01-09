require 'mail'

Mail.defaults do
  delivery_method :smtp, {
    :port      => 587,
    :address   => "smtp.mailgun.org",
    :user_name => "postmaster@sandbox00c1631dcb36496dbdd5f58241eda3e5.mailgun.org",
    :password  => "bf2e44308717266a4672e5e7b88f7671",
  }
end
=begin
mail = Mail.deliver do
  to      'sghosh968@gmail.com'
  from    'suman@challengify.com'
  subject 'Hello'

  text_part do
    body 'Testing some Mailgun awesomness'
  end
end

=end
