# LD Relay Offline Snapshot

Create LD Relay images configured in offline mode with the flag data copied in.

**Warning**: Do not distribute the images created by this docker file. It will contain your flag rules. This is mostly for testing. The autoconfig key, however, will not be in the image or history. 

## Usage

```
# write your relay key to secrets file
echo 'rel-123123' > relay_key.txt
# build the image
# VERSION is the tag for ldrelay
# for example latest or v6


$ docker build . --secret id=relay_key,src=relay_key.txt --build-arg VERSION=latest -t ldsnapshot:latest -t ldsnapshot:$(date -u +%Y%m%d%H%M)

# run 
$ docker run -i --rm ldsnapshot:202105212229
2021/05/21 22:29:22.762671 INFO: Starting LaunchDarkly relay version 6.1.2 with configuration from environment variables
2021/05/21 22:29:22.764778 INFO: [FileDataSource] Added environment 5dc455b378728b0983895ad2 (Tarq Scratchpad Test)

```
