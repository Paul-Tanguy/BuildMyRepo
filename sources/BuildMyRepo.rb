#!/usr/bin/env ruby

$AssetsDir = "~/Docs/Epi/CTM/BuildMyRepo/assets"
$binary = "myProject"
$repo = "myProject"

def copyFiles()
  system("cp -v #{$AssetsDir}/gitignore ./.gitignore")
  system("cp -v #{$AssetsDir}/main.cpp ./sources/main.cpp")
  system("cp -v #{$AssetsDir}/binary.cpp ./sources/#{$binary}.cpp")
  system("cp -v #{$AssetsDir}/header.hpp ./includes/#{$binary}.hpp")
  system("cp -v #{$AssetsDir}/Makefile ./Makefile")
  system("cp -v #{$AssetsDir}/Testfile ./tests/Makefile")
  system("cp -v #{$AssetsDir}/test_basic.cpp ./tests/sources/test_basic.cpp")
  system("cp -v #{$AssetsDir}/my_criterion.hpp ./tests/my_criterion.hpp")
end

def makeDirs()
  system("mkdir -v sources")
  system("mkdir -v includes")
  system("mkdir -v tests")
  system("mkdir -v tests/sources")
  system("mkdir -v libs")
end

def updateFiles()
  replaces = {
    :"<% binary %>" => "#{$binary}",
    :"<% BINARY %>" => "#{$binary}".upcase(),
    :"<% repository %>" => "#{$repo}",
  }
  files = [
    "sources/main.cpp",
    "sources/#{$binary}.cpp",
    "includes/#{$binary}.hpp",
    "Makefile",
    "tests/Makefile",
    "tests/sources/test_basic.cpp",
    "tests/my_criterion.hpp",
    ".gitignore",
  ]

  files.each() do |file|
    stream = File.open(file)
    data = stream.read()

    puts("in: #{file}")
    replaces.each() do |from, to|
      puts("\treplacing #{from} by #{to}")
      data.gsub!(from.to_s(), to)
    end
    puts()
    File.write(file, data);
    stream.close()
  end
end

def main()
  response = ""
  puts("[bmr] copy base architecture here ?")
  print("[Y/n]> ")
  response = gets()
  if (response != "\n" && response != "y\n" && response != "Y\n")
    exit(1)
  end
  puts()
  puts("[bmr] name of the binary?")
  print("[...]> ")
  $binary = gets()
  $binary = $binary[0..-2]
  if ($binary == "\n" || $binary == "")
    exit(1)
  end
  puts()
  puts("[bmr] name of the repository?")
  print("[...]> ")
  $repo = gets()
  $repo = $repo[0..-2]
  if ($repo == "\n" || $repo == "")
    exit(1)
  end
  puts()
  puts("[bmr] Building directories...")
  makeDirs()
  puts()
  puts("[bmr] Copying default files...")
  copyFiles()
  puts()
  puts("[bmr] Updating file contents...")
  updateFiles()
  puts("[bmr] Done.")
end

main();