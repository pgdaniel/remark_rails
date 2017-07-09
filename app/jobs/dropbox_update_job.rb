class DropboxUpdateJob < ApplicationJob
  queue_as :default

  def perform
    token = ENV['DROPBOX_OATH2_TOKEN']
    client = DropboxApi::Client.new(token)
    result = client.list_folder "/Markdown/Remark"

    entries = result.entries

    links = entries.map do |entry|
      client.get_temporary_link(entry.path_display)
    end

    links.each_with_index do |link, i|
      response = HTTParty.get(link.link)

      title = entries[i].name.split('.')[0]

    markdown = Markdown.find_or_create_by(title: title)
    markdown.content = response.body
    markdown.save
    end
  end
end
