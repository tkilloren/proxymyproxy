#!/bin/sh
#=================================
# Run a local proxy that logs into
# your company's proxy with your
# credentials so you can get back
# to building things.
#=================================


proxy=$1
local_port=8000

config_file="${HOME}/.cntlm.conf"

#-----------------
# Install Binary
#-----------------
if ! command -v cntlm; then
  echo 'Installing cntlm...'
  brew install cntlm
fi

#-----------------
# Create config
#-----------------
if [ -e "${config_file}" ]; then
  echo 'If you would like to regenerate the config delete it and rerun:'
  echo "rm ${config_file}"
else
  ad_domain=$(dsconfigad -show |awk '/Active Directory Domain/{print $NF}')
  printf %s 'Password: '
  pwd_hash=$(cntlm -u "${USER}@${ad_domain}" -H\
             |grep 'PassNTLMv2'\
             |awk '{print $2}')
  echo
cat << EOF > "${config_file}"
Proxy      ${proxy}
Domain     ${ad_domain}
Username   ${USER}
PassNTLMv2 ${pwd_hash}

Listen     ${local_port}
EOF

fi

# Guess at public ip of workstation
default_dev=$(route -n get default \
              |grep 'interface:' \
              |awk '{print $2}')
public_ip=$(ifconfig "${default_dev}" \
            |grep 'inet ' \
            | awk '{print $2}')
echo
echo '----------------Example Usage----------------------'
echo "export http_proxy=http://${public_ip}:${local_port}"
echo "export https_proxy=http://${public_ip}:${local_port}"
echo '---------------------------------------------------'
echo

#-----------------
# Run Proxy Server
#-----------------
# Use -g to listen on public ip
cntlm -v -f -g -c ~/.cntlm.conf
