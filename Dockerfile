# v1.0
# Generate with:
# docker build -t urbackup_client_smb:1.0 .
# urClient Version: 2.4.10

FROM alpine:3.12.0

# install packages
RUN apk --no-cache add bash wget cifs-utils
RUN TF=$(mktemp) && wget "https://hndl.urbackup.org/Client/2.4.10/UrBackup%20Client%20Linux%202.4.10.sh" -O $TF && sh $TF; rm -f $TF

COPY entrypoint.sh /usr/bin/
# Make entrypoint-script executable
RUN chmod +x /usr/bin/entrypoint.sh

RUN mkdir /data

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
