FROM ruby:2.5

ENV APPDIR /var/www/farmomatic

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client \
    && useradd -m user

RUN mkdir -p $APPDIR

WORKDIR $APPDIR

COPY Gemfile $APPDIR/Gemfile
COPY Gemfile.lock $APPDIR/Gemfile.lock

RUN bundle install

COPY . $APPDIR

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# User not root
RUN chown user:user -R $APPDIR
USER user

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

# sudo chown -R $USER:$USER .
# docker-compose run web rails new . --force --no-deps --database=postgresql