#/bin/bash
# Slack login notification script
# Can be triggered from /etc/profile for all users

USERNAME=$(whoami)
HOST=$(hostname)
IP_ADDR=$(hostname --ip-address)
IP_FROM=$(last | grep $(whoami) | grep 'still logged in' | head -1 | awk '{print $3}')

curl -X POST --data-urlencode "payload={\"channel\": \
  \"#ssh_notifications\", \
  \"text\": \"User: *${USERNAME}* logged into *${HOST}* ($IP_ADDR) at $(date) from *${IP_FROM}*\", \
  \"icon_emoji\": \":computer:\"}" \
  https://hooks.slack.com/services/YOUR/TOKEN/HERE
