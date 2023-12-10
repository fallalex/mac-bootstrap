Copy the generated SSH public keys to ~/.ssh repo to a directory named based on the hash from the serial number

    cp -r $SCRIPT_PATH/$PUBLIC_KEYS_DIR/$SERIAL_HASH ~/.ssh/$PUBLIC_KEYS_DIR/
    git -C ~/.ssh add ~/.ssh/$PUBLIC_KEYS_DIR
    git -C ~/.ssh commit -m '$SERIAL_HASH public keys'
    git -C ~/.ssh push

Using a preestablished environment add the new public keys to version control services

    glab ssh-key add -t $SERIAL_HASH $PUBLIC_KEYS_DIR/$SERIAL_HASH/id_ed25519.pub
    gh ssh-key add -t $SERIAL_HASH $PUBLIC_KEYS_DIR/$SERIAL_HASH/id_ed25519_personal.pub
    rsync -p $PUBLIC_KEYS_DIR/$SERIAL_HASH/id_ed25519_personal.pub git.labfall.com:/tmp/$SERIAL_HASH.pub
    # Run this on git.labfall.com
    cat /tmp/$SERIAL_HASH.pub >> /etc/.ssh/authorized_keys/git
