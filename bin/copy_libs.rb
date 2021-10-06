#!/usr/bin/env ruby

#
# utility to copy libraries (some installed via Aptfile) which are referenced by the R packages
# built during execution of init.R/packrat/renv, which need to be "packaged" into the slug since
# the chroot isn't included at runtime.
#
# this script uses ldd to inspect each .so file in the given directory to get the referenced .so
# files to copy them to /app/R/lib/R/lib so that they can be found at runtime.
#
# any dynamic dependencies, such as a command line utilities, scripts or any other files, won't be
# included in this process, as there is no definitive way to know what is needed, so YMMV.
#

require 'open3'

def find_depend_libs(binary)
  cmd = "/usr/bin/ldd #{binary} | /usr/bin/awk '{print $3}' | /usr/bin/sort -u"

  output = ""
  res = nil
  Open3.popen2e(cmd, :chdir=>"/") do |stdin, stdout_stderr, wait_thr|
    output = stdout_stderr.read.chomp
    res = wait_thr.value
  end

  raise StandardError.new("Failed to find dependent libraries for '#{binary}'. #{output}") if res&.exitstatus != 0

  output.split("\n")
      .reject {|s| s == "" }
      .reject {|s| s =~ /^\/app/ }
      .select {|s| File.exists?(s) }
      .collect {|f| [f, File.basename(f)] }
end

def copy_depend_libs(path, binary)
  find_depend_libs(binary).each do |src, dest|
    target = File.join(path, dest)
    next if File.exists?(target)
    print "⦁ #{src} → #{target} "
    copy_binary_file src, target
    if target =~ /\.so/ && target !~ /\.so$/
      Dir.chdir(File.dirname(target)) do
        basename = File.basename(target)
        symlinkname = basename.sub(/\.so.*/, ".so")
        File.symlink(basename, symlinkname) unless File.exists?(symlinkname)
      end
    end
    print "[OK]\n"
    copy_depend_libs path, src
  end
end

def copy_binary_file(src, target)
  File.open(src, 'rb') do |f|
    File.open(target, 'wb') do |g|
      g.chmod(0777) # executable
      g.write(f.read)
    end
  end
end

# where to search
#  e.g. /app/R/site-library/**/*.so
search=ARGV[0]

puts "Searching in #{search}"

# destination for copied libs
dest_path = "/app/R/lib/R/lib"

# all related SO files
Dir.glob(search).each do |binary|
  copy_depend_libs(dest_path, binary)
end
