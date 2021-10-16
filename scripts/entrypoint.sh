#!/bin/sh

# Pre-Processing
echo "Changing ownership of /config to $PUID:$PGID" | 
  tee -a /var/tmp/tmp.log
chown -R $PUID:$PGID /config

echo "Starting OMVS" | tee -a /var/tmp/tmp.log
# echo "omvs $(grep -v "#" /config/IPTV_ADDRESS)"
omvs $(grep -v "#" /config/IPTV_ADDRESS)

# Post-Processing 
echo "Changing ownership of /omvs_out to $PUID:$PGID" | 
  tee -a /var/tmp/tmp.log
chown -R $PUID:$PGID /omvs_out