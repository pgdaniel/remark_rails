namespace :import do
  desc "Import markdown from Dropbox"
  task dropbox: :environment do
    DropboxUpdateJob.perform_now
  end
end
