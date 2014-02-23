# Learn more: http://github.com/javan/whenever

set :output, "/home/pi/bandango/log/cron.log"

job_type :bandango, "cd /home/pi/bandango && :task"

# every 1.hour do
every 15.minutes do
  runner "SaniGetWorker.schedule"
end

every :day, :at => "03:00am" do
  bandango "git pull && bundle install --deployment"
end
every :day, :at => "03:10am" do
  rake "db:migrate"
end
every :day, :at => "03:20am" do
  rake "db:seed"
end
every :day, :at => "03:30am" do
  rake "assets:precompile"
end
every :day, :at => "04:00am" do
  command "sudo service bandango restart"
  command "sudo service sidekiq stop"
end
every :day, :at => "04:10am" do
  command "sudo service sidekiq start"
end

if ENV["DUMMY_DB"]
  every :day, at: "01:00am" do
    rake "db:dummy"
  end
end
