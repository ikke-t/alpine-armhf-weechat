#!/bin/sh

echo "Updating permissions with ${UID}:${GID}..."
if $(find $WEECHAT_HOME ! -user $UID -o ! -group $GID|egrep '.' -q); then
  echo "Updating permissions in $WEECHAT_HOME..."
  chown -R $UID:$GID $WEECHAT_HOME
else
  echo "Permissions in $HOME are correct."
fi

echo "Done updating permissions."

exec su-exec $UID:$GID sh -c "tmux -L /tmp/weechat new-session -s weechat -d /usr/bin/weechat"
#exec su-exec $UID:$GID sh -c "while true; sleep 1; done"
#exec su-exec $UID:$GID sh -c "/usr/bin/weechat"
