require "../src/srt"

path = "lost-s01e01-pilot.srt"
subtitle = SRT::File.parse(File.read(path))

puts <<-STRING
   Lines: #{subtitle.lines.size}
Duration: #{subtitle.lines.last.finishs_at.to_s("%H:%M:%S")}
STRING
