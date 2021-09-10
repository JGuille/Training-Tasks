#!/bin/bash
cd /home/jguille_escalona/
# Create cron script
echo '#!/bin/bash' >> cron.sh
echo 'current_time=$(date "+%Y.%m.%d-%H.%M.%S")' >> cron.sh
echo 'new_fileName=$pubsub.$current_time.json' >> cron.sh
echo '/snap/google-cloud-sdk/197/bin/gcloud pubsub subscriptions pull projects/loadout-incoming/subscriptions/pull --format json >> $new_fileName' >> cron.sh
echo '/snap/google-cloud-sdk/197/bin/gsutil cp $new_fileName gs://epam-demobk/$new_fileName' >> cron.sh

# Make cron script executable
chmod +x /home/jguille_escalona/cron.sh

#Start Crontab
sudo systemctl enable cron
sudo service cron start

#Write out current crontab
crontab -l > mycron

#Echo new cron into cron file
echo "*/6 * * * * /home/jguille_escalona/cron.sh" >> mycron

#install new cron file
crontab mycron
rm mycron