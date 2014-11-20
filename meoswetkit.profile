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
  wetkit_install();
  meoswetkit_install();
}
?>

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
