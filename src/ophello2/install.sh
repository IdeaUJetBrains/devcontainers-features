#!/bin/sh
set -e

echo "Feature 'ophello1'"
HELLO=${HELLO:-undefined}
echo "The provided str is: $HELLO"


echo "remoteUser is '$_REMOTE_USER'"
echo "remoteUser's home directory is '$_REMOTE_USER_HOME'"
echo "User is '$_CONTAINER_USER'"
echo "User's home directory is '$_CONTAINER_USER_HOME'"

cat > /usr/local/bin/hello \
<< EOF
#!/bin/sh
RED='\033[0;91m'
NC='\033[0m' # No Color
echo "\${RED}${HELLO}, \$(whoami)!\${NC}"
EOF
chmod +x /usr/local/bin/hello