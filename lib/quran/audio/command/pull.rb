# frozen_string_literal: true

module Quran::Audio
  class Command::Pull < Command
    set_banner usage: "quran-audio pull [OPTIONS]",
               description: "Pull MP3 files from everyayah.com"
    set_option "-a AUTHOR", "--author AUTHOR", "An author's name"
    set_option "-b BITRATE", "--bitrate BITRATE", "MP3 bitrate"
    set_option "-s NUMBERS", "--surahs NUMBERS", "Comma-separated list of surah IDs", as: Array
    set_option "-d SECONDS", "--delay", "Delay between requests, in seconds", as: Float
    set_default author: "alafasy", surahs: (1..114).to_a, delay: 0.5

    attr_reader :http

    def initialize(...)
      super
      @http = Net::HTTP.new("everyayah.com", 443).tap { _1.use_ssl = true }
      @surah_length = Ryo.from_json(path: path.length)
    end

    def run
      surahs.each do |surah|
        1.upto(surah_length(surah)) do |ayah|
          mp3 = MP3.new(author:, surah:, ayah:, bitrate:)
          pull(mp3, options.delay) unless File.exist?(mp3.local_path)
          percent = sprintf("%.2f", (ayah / surah_length(surah).to_f) * 100)
          line.rewind.print "Surah #{surah} [#{percent}%]"
        end
        line.end
      end
    end

    private

    def pull(mp3, delay, interrupt: false)
      res = http.get(mp3.remote_path)
      write(mp3, res, interrupt:)
      sleep(delay)
    rescue Interrupt
      line.end.rewind.print("Wait for a graceful exit").end
      pull(mp3, delay, interrupt: true)
    rescue SocketError, SystemCallError, Net::OpenTimeout => e
      line.end.rewind.print("#{e.class}: retry")
      interrupt ? throw(:interrupt, true) : pull(mp3, delay)
    end

    def write(mp3, res, interrupt:)
      case res
      when Net::HTTPOK
        mkdir_p File.dirname(mp3.local_path)
        File.binwrite(mp3.local_path, res.body)
        throw(:interrupt, true) if interrupt
      else
        puts "error #{res.body}"
      end
    end

    def surah_length(surah)
      @surah_length[surah.to_s]
    end
  end
end