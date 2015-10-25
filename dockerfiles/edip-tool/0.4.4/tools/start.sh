# via ENV: APP_NAME
# IP=$(ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')

###
## Name of the node
# -name edip_app_test@127.0.0.1
### If created with RELX_REPLACE_OS_VARS=true, this is possible:
# -name ${NODE_NAME}@${NODE_IP}
#
# ## Cookie for distributed erlang
# -setcookie edip_app_test
