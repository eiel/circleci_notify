require "circleci_notify/version"
require "circleci_notify/notifier"

module CircleciNotify
  def self.run
    notifier = CircleciNotify::Notifier.new
    notifier.notify
  end
end
