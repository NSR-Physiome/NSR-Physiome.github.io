<?php
  print "<em>This page is for the current JSim version 2.0 and higher.\n";
  $url  = $_SERVER["PHP_SELF"];
  $url = str_replace("docs", "docs16", $url);
  print "Click <a href=\"" . $url . "\">here</a> for the earlier JSim 1.6 version.</em>";
?>
