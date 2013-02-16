class SoundTuber
  @queue = 'soundtube'

  def self.perform(url)
    command = "youtube-mp3 '#{url}'"
    system(command)
  end
end
