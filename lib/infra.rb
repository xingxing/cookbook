require 'fileutils'

def require_dir(dir)
  Dir.foreach(dir) do |entry|
    next if (entry == "." || entry == "..")
    absolute_path = File.join(dir, entry)
    if (File.file?(absolute_path) && absolute_path.end_with?("rb"))
      require absolute_path
    end
    require_dir(absolute_path) if File.directory?(absolute_path)
  end
end
