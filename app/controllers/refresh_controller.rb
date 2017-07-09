class RefreshController < ApplicationController
  def show
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

      Markdown.find_or_initialize_by(title: title) do |markdown|
        markdown.content = response.body
      end.save
    end

    redirect_to remark_index_url
  end
end
