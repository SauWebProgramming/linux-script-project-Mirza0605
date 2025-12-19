#!/bin/bash

TARIH=$(date)
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
RAM=$(free -m | awk 'NR==2{printf "%s MB / %s MB", $3,$2}')
DISK=$(df -h / | awk 'NR==2{print $3 " / " $2 " (" $5 ")" }')
KULLANICI=$(who | wc -l)

cat > /var/www/html/index.html <<EOF
<html>
<head><title>Sunucu Durum Paneli</title></head>
<body>
<h1>Sunucu Durum Paneli</h1>
<p><b>Tarih:</b> $TARIH</p>
<p><b>CPU Kullanimi:</b> %$CPU</p>
<p><b>RAM Kullanimi:</b> $RAM</p>
<p><b>Disk Durumu:</b> $DISK</p>
<p><b>Aktif Kullanici Sayisi:</b> $KULLANICI</p>
</body>
</html>
EOF
