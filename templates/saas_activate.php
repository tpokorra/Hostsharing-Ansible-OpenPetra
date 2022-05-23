<?php

function Get($index, $defaultValue) {
  return isset($_GET[$index]) ? $_GET[$index] : $defaultValue;
}

# check SaasActivationPassword
if (Get('SaasActivationPassword', 'invalid') != '{{SaasActivationPassword}}') {
  echo '{"success": false, "msg": "invalid SaasActivationPassword"}';
  exit(1);
}

$USER_EMAIL_ADDRESS = Get('UserEmailAddress', '');
if (empty($USER_EMAIL_ADDRESS)) {
  echo '{"success": false, "msg": "missing email address"}';
  exit(1);
}

try {
    # enable the administrator user, and set the email address
    $pdo = new PDO('mysql:host=localhost;dbname={{pac}}_{{user}}', '{{pac}}_{{user}}', '{{password}}');
    $stmtUpdate = $pdo->prepare("UPDATE s_user SET s_account_locked_l=0, s_failed_logins_i=0, s_email_address_c=?, created_at=NOW(), updated_at=NOW() WHERE login=? AND s_account_locked_l=1");
    $stmtUpdate->execute([$USER_EMAIL_ADDRESS, 'SYSADMIN']);
}
catch (Exception $e) {
    // echo 'Exception caught: ',  $e->getMessage(), "\n";
    echo '{"success": false, "msg": "error happened"}';
    exit(1);
}

echo '{"success": true}';
?>
