# UrBackup-Client SMB

This Alpine Linux container mount an samba share into /data and start the UrBackup client service. 

From the UrBackup server set /data in "Default Directories to Backup".

## Enviromment variables:

**USER, PASS, DOMAIN, SERVER, SHARE_NAME** refers to the required information to connect the samba share within the container

## yml example:

    
    version: '3.5'
    services:
      urbackup_client_srv1:
        image: tamuxx/urbackup_client_smb
        container_name: srv1_urclient
        restart: unless-stopped
        hostname: SRV1
        cap_add:
          - ALL
        environment:
          - SERVER=server ip or server name
          - SHARE_NAME=share
          - DOMAIN=domain or server name
          - USER=user
          - PASS=password
      networks:
        backup_bridge:
          ipv4_address: 10.101.0.10
    networks:
      backup_bridge:
        name: docker2
        driver: bridge
        ipam:
          config:
            - subnet: 10.101.0.0/16
        driver_opts:
          com.docker.network.bridge.name: docker2


