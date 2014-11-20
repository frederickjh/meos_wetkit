core = 7.x
api = 2

; Drupal core
projects[drupal][type] = "core"

;Stanford Metatag Nobots so test sites do not get indexed
projects[stanford_metatag_nobots][type] = "module"
projects[stanford_metatag_nobots][download][type] = "git"
projects[stanford_metatag_nobots][download][url] = "git@github.com:SU-SWS/stanford_metatag_nobots.git"

; Libraries
libraries[profiler][download][type] = "get"
libraries[profiler][download][url] = "http://ftp.drupal.org/files/projects/profiler-7.x-2.0-beta2.tar.gz"

; Tasty Backend stuff.
; Tasty Backend modules.

projects[tasty_backend_base][type] = "module"
projects[tasty_backend_base][download][type] = "git"
projects[tasty_backend_base][download][url] = "git@github.com:jenitehan/tasty_backend_base.git"
; projects[tasty_backend_base][download][url] = "https://github.com/jenitehan/tasty_backend_base.git"
projects[tasty_backend_base][subdir] = "tasty_backend"

projects[tasty_backend_standard][type] = "module"
projects[tasty_backend_standard][download][type] = "git"
projects[tasty_backend_standard][download][url] = "git@github.com:jenitehan/tasty_backend_standard.git"
; projects[tasty_backend_standard][download][url] = "https://github.com/jenitehan/tasty_backend_standard.git"
projects[tasty_backend_standard][subdir] = "tasty_backend"

projects[tasty_backend_demo][type] = "module"
projects[tasty_backend_demo][download][type] = "git"
projects[tasty_backend_demo][download][url] = "git@github.com:jenitehan/tasty_backend_demo.git"
; projects[tasty_backend_demo][download][url] = "https://github.com/jenitehan/tasty_backend_demo.git"
projects[tasty_backend_demo][subdir] = "tasty_backend"

; Tasty Backend Contrib modules.

projects[admin_menu][version] = 3.0-rc4
projects[admin_menu][subdir] = "contrib"

projects[admin_menu_source][version] = 1.0
projects[admin_menu_source][subdir] = "contrib"

projects[context_admin][version] = 1.x-dev
projects[context_admin][subdir] = "contrib"
projects[context_admin][patch][] = "https://drupal.org/files/undefined_index-1760610-3.patch"
projects[context_admin][patch][] = "https://drupal.org/files/issues/context_admin-reset_terms_alphabetical_redirect-2276567-1.patch"

projects[ctools][version] = 1.4
projects[ctools][subdir] = "contrib"

projects[entity][version] = 1.5
projects[entity][subdir] = "contrib"

projects[field_group][version] = 1.3
projects[field_group][subdir] = "contrib"

projects[menu_admin_per_menu][version] = 1.0
projects[menu_admin_per_menu][subdir] = "contrib"

projects[override_node_options][version] = 1.12
projects[override_node_options][subdir] = "contrib"

projects[role_delegation][version] = 1.1
projects[role_delegation][subdir] = "contrib"

projects[user_settings_access][version] = 1.0
projects[user_settings_access][subdir] = "contrib"

projects[view_unpublished][version] = 1.1
projects[view_unpublished][subdir] = "contrib"

projects[views][version] = 3.8
projects[views][subdir] = "contrib"

projects[views_bulk_operations][version] = 3.2
projects[views_bulk_operations][subdir] = "contrib"

; END Tasy Backend stuff

; Translations
translations[] = de

; Web Experience Kit Distribution
includes[wetkit] = "./projects/wetkit/build-wetkit.make"

; MEOS Wetkit Shiny Theme
projects[meoswetkit_shiny][type] = "profile"
projects[meoswetkit_shiny][download][type] = "git"
projects[meoswetkit_shiny][download][url] = "git@github.com:frederickjh/meoswetkit_shiny.git"

;;;; Commented out for testing
; Install profile
;projects[wetkit][type] = "profile"
;projects[wetkit][download][type] = "git"
;projects[wetkit][download][url] = "git://github.com/wet-boew/wet-boew-drupal.git"
; Download version 7.x-1.0-rc23 translation file as it has a more complete translation file than more recent versions.
projects[wetkit][l10n_path] = "http://ftp.drupal.org/files/translations/7.x/wetkit/wetkit-7.x-1.0-rc23.de.po"
