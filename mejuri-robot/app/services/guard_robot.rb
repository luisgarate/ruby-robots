class GuardRobot
  require 'net/http'
  require 'json'
  require 'uri'


  def self.check_defects
    all_completed_cars = Car.includes(:computer, :seats, :wheels, :chassis, :laser).where(complete: true, ready_to_store: false)

    result = all_completed_cars.map{|car| car.computer.parts_status}
    format_fields(result)
    send_slack_notification(result)
  end

  def self.transfer_stock
    all_ready_to_store_cars = Car.where(ready_to_store: true).update_all(store: true, place: "Store")
  end



  def self.send_slack_notification(result)
    uri = URI('https://hooks.slack.com/services/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')
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri)
    http.use_ssl = true
    request.body = build_body(result).to_json
    response = http.request(request)
  end

  def self.format_fields(results)
    fields = []
    results.each do |element|
      defects = []
      element[:defects].each{|d| defects << "#{d[:part]} id: #{d[:id]}"}
      text = "#{element[:msg]}: #{defects.join(", ")}"
      field = {type: 'mrkdwn', text: text}
      fields << field
    end
    fields
  end

  def self.build_body(result)
    { text: "Guard robot - Defects report",
      attachments: [{ color: 'warning',
                      pretext: 'Defects report',
                      fields: format_fields(result)
                    }]
    }
  end
end
