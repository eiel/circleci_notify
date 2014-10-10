require "chatwork"

module CircleciNotify
  class Notifier
    attr_reader :message

    def initialize(message)
      @api = ENV["CHATWORK_API"]
      @room_id = ENV["CHATWORK_ROOM_ID"].to_i
      @message = message
    end

    def notify
      ChatWork.api_key = @api
      ChatWork::Message.create(room_id: @room_id, body: body)
    end

    def body
      <<-MESSAGE
      [info][title]CircleCI Builds #{message}[/title]
      build report: #{build_report}
      compare: #{compare}
      commits: #{github}/#{sha}
      [/info]
MESSAGE
    end

    def compare
      ENV["CIRCLE_COMPARE_URL"]
    end

    def build_report
      "https://circleci.com/gh/#{username}/#{reponame}/number"
    end

    def number
      ENV["CIRCLE_BUILD_NUM"]
    end

    def reponame
      ENV["CIRCLE_PROJECT_REPONAME"]
    end

    def username
      ENV["CIRCLE_PROJECT_USERNAME"]
    end

    def sha
      ENV["CIRCLE_SHA1"]
    end

    def github
      "https://github.com/#{username}/#{reponame}"
    end
  end
end
