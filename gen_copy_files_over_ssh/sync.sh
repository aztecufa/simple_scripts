
#!/bin/bash
for n in {1..3}
do
name=$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32)
base64 /dev/urandom | head -c 10000000 > files/$name.txt
scp files/$name.txt 192.168.1.112:/home/benderino/files/
done
ssh 192.168.1.112 'find /home/benderino/files -type f -mtime +7 -delete'

