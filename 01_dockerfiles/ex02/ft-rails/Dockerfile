##### Usage #####
# Build : docker-build -t ft-rails:on-build
# Run : Do not run it as it is, must be called by Dockerfile in parent folder

FROM ruby

# Install apt based dependencies required to run Rails as 
# well as RubyGems. As the Ruby image itself is based on a 
# Debian image, we use apt-get to install those.
ONBUILD RUN apt-get update && apt-get install -y \ 
  build-essential \ 
  nodejs

# Configure the main working directory. This is the base 
# directory used in any further RUN, COPY, and ENTRYPOINT 
# commands.
ONBUILD RUN mkdir -p /app 
ONBUILD WORKDIR /app

# Copy the Gemfile as well as the Gemfile.lock and install 
# the RubyGems. This is a separate step so the dependencies 
# will be cached unless changes to one of those two files 
# are made.
ONBUILD COPY ft-rails/Gemfile ft-rails/Gemfile.lock ./
ONBUILD RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copy the main application.
ONBUILD COPY ./ft-rails/ ./

ONBUILD RUN bundle exec rake db:migrate
ONBUILD RUN bundle exec rake db:schema:load
ONBUILD RUN bundle exec rake db:seed

# Expose port 3000 to the Docker host, so we can access it 
# from the outside.
ONBUILD EXPOSE 3000

# The main command to run when the container starts. Also 
# tell the Rails dev server to bind to all interfaces by 
# default.