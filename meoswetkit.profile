<?php
/**
 * @file
 * MEOS Wetkit Drupal .profile file.
 */

/**
 * Include for Profiler library.
 */
!function_exists('profiler_v2') ? require_once('libraries/profiler/profiler.inc') : FALSE;
profiler_v2('meoswetkit');

/**
 * Implement hook_install().
 *
 * Perform actions to set up the site for this profile.
 */
function meoswetkit_install() {
  include_once DRUPAL_ROOT . '/profiles/meoswetkit/meoswetkit.install';
  include_once DRUPAL_ROOT . '/profiles/wetkit/wetkit.install';
  wetkit_install();
  meoswetkit_install();
}

/**
 * Task callback: shows the welcome screen.
 */
function meoswetkit_install_welcome($form, &$form_state, &$install_state) {
  drupal_set_title(st('Welcome'));

  $message = st('Thank you for choosing the MEOS Web Experience Toolkit Drupal Distribution!') . '<br />';
  $message .= '<p>' . st('This distribution installs Drupal with
    preconfigured features that will help you meet Enterprise Standards.') . '</p>';
  $message .= '<p>' . st('Please note that this is a community-supported work in progress,
    so be sure to join us over on ' . l(t('github.com/wet-boew/wet-boew-drupal'), 'http://github.com/wet-boew/wet-boew-drupal') .
    ' and help us improve this product.') . '</p>';

  $form = array();
  $form['welcome_message'] = array(
    '#markup' => $message,
  );
  $form['actions'] = array(
    '#type' => 'actions',
  );
  $form['actions']['submit'] = array(
    '#type' => 'submit',
    '#value' => st("Let's Get Started!"),
    '#weight' => 10,
  );
  return $form;
}

/**
 * Implements hook_install_tasks_alter().
 */
function meoswetkit_install_tasks_alter(&$tasks, $install_state) {
  $tasks['install_select_profile']['display'] = FALSE;
  $tasks['install_select_locale']['display'] = FALSE;

  // Hide some messages from various modules that are just too chatty.
  drupal_get_messages('status');
  drupal_get_messages('warning');

  // The "Welcome" screen needs to come after the first two steps
  // (profile and language selection), despite the fact that they are disabled.
  $new_task['wetkit_install_welcome'] = array(
    'display' => TRUE,
    'display_name' => st('Welcome'),
    'type' => 'form',
    'run' => isset($install_state['parameters']['welcome']) ? INSTALL_TASK_SKIP : INSTALL_TASK_RUN_IF_REACHED,
  );
  $old_tasks = $tasks;
  $tasks = array_slice($old_tasks, 0, 2) + $new_task + array_slice($old_tasks, 2);

  _wetkit_set_theme('wetkit_shiny');

  // If using French Locale as default remove associated Install Task.
  unset($tasks['install_import_locales']);
  unset($tasks['install_import_locales_remaining']);

  // Magically go one level deeper in solving years of dependency problems.
  require_once drupal_get_path('module', 'wetkit_core') . '/wetkit_core.profile.inc';
  $tasks['install_load_profile']['function'] = 'wetkit_core_install_load_profile';
}
