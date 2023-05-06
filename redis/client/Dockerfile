# Layer 1. Download base ruby image
FROM ruby:3.0.3

# Layer 2. Copying Gemfile and Gemfile.lock.
COPY Gemfile* ./

# Layer 3. Installing dependencies.
RUN bundle check || bundle install --jobs 20 --retry 5

# Layer 4. Create new user
RUN useradd ruby

# Layer 5. Switch user
USER ruby:ruby

# Layer 6. Copy application changing its permissions
COPY --chown=ruby:ruby . .

# Layer 7. Change permission
RUN chmod +x docker-entrypoint.sh