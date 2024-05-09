FROM ruby:3.3.1-alpine
COPY post.rb /
RUN gem install sinatra
EXPOSE 4567
CMD ["ruby", "/post.rb"]