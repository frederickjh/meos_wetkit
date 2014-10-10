core = 7.x
api = 2

; Drupal core
projects[drupal][type] = "core"


; Install profile
projects[meos_wetkit][type] = "profile"
projects[meos_wetkit][download][type] = "git"
projects[meos_wetkit][download][url] = "git://github.com/wet-boew/wet-boew-drupal.git"

; Libraries
libraries[profiler][download][type] = "get"
libraries[profiler][download][url] = "http://ftp.drupal.org/files/projects/profiler-7.x-2.0-beta2.tar.gz"
