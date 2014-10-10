require "chatwork"

module CircleciNotify
  class Notifier
    def initialize
      @api = ENV["CHATWORK_API"]
      @room_id = ENV["CHATWORK_ROOM_ID"].to_i
    end

    def notify
      ChatWork.api_key = @api
      ChatWork::Message.create(room_id: @room_id, body: body)
    end

    def body
      <<-MESSAGE
      [info][title]CircleCI Builds[/title]
      Success
      hogehoge
      [/info]
MESSAGE
    end
  end
end
