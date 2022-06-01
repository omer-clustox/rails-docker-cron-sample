FROM ruby:3.0.0
RUN apt-get update && apt-get -y install cron

# Copy cron file to the cron.d directory on container
COPY cron /etc/cron.d/cron

# Give execution access
RUN chmod 0644 /etc/cron.d/cron

# Run cron job on cron file
RUN crontab /etc/cron.d/cron

# Create the log file
RUN touch /var/log/cron.log

# Run the command and record the log
CMD cron && tail -f /var/log/cron.log

