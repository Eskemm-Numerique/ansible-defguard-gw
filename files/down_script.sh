iptables -D FORWARD -i wg0 -o ens3 -j ACCEPT
iptables -D FORWARD -i ens3 -o wg0 -j ACCEPT
