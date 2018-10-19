Unifi:   5.9.29
MongoDB: 3.6

The unifi software now natively runs as a non-root user, but doing so requires the `DAC_READ_SEARCH` capability be added to your run command:

```bash
   docker volume create unifi
   docker run --cap-add DAC_READ_SEARCH -v unifi:/var/lib/unifi travishegner/docker-unifi
```

#Permissions Note#
Earlier versions of this image did their own work-around to run the unifi software as the `nobody` user. Now that the software runs as the `unifi` user in this image, you may run into permissions issues when trying to upgrade to this image.

The easiest method to get around this issue is to use unifi's backup facility in the software to download a complete backup image, then restore it to a brand new docker container with a brand new data volume utilizing the new version of this image.
