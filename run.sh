# shellcheck disable=SC2239
#!bin/bash
#  Symfony 4.4 LTS file permissions
HTTP_USER=$(ps axo user,comm | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\  -f1)
echo 'Fill your currently system users password'
sudo -S setfacl -dR -m u:"$HTTP_USER":rwX -m u:"$(whoami)":rwX var
sudo -S setfacl -R -m u:"$HTTP_USER":rwX -m u:"$(whoami)":rwX var