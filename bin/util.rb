#!/usr/bin/env ruby

wrapper_file = ARGV[0]
init_file = ARGV[1]
app_dir = ARGV[2]
cran_mirror = ARGV[3]

wrapper_file_content = File.read(wrapper_file)
init_file_content = "\n\n" + File.read(init_file) + "\n\n"

# insert placeholders, APP_DIR, CRAN_MIRROR and INIT_FILE_CONTENT

wrapper_file_content.gsub!(/APP_DIR/, app_dir)
wrapper_file_content.gsub!(/CRAN_MIRROR/, cran_mirror)
wrapper_file_content.gsub!(/INIT_FILE_CONTENT/, init_file_content)

File.open(wrapper_file, 'w') do |f|
	f.write(wrapper_file_content)
end

exit 0
