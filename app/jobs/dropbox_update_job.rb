class DropboxUpdateJob < ApplicationJob
  queue_as :default

  def perform
    token = ENV['DROPBOX_OATH2_TOKEN']
    client = DropboxApi::Client.new(token)
    result = client.list_folder ENV['PATH_TO_DROPBOX_FOLDER_TO_IMPORT']

    entries = result.entries

    links = entries.map do |entry|
      client.get_temporary_link(entry.path_display)
    end

    links.each_with_index do |link, i|
      response = HTTParty.get(link.link)

      title = entries[i].name.split('.')[0]

    markdown = Markdown.find_or_create_by(title: title)
    # TODO: if markdown.content == response.body...
    # mark as conflict or create versions
    markdown.content = response.body
    markdown.save
    end
  end
end
