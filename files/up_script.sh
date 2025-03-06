iptables -A FORWARD -i wg0 -o ens3 -j ACCEPT
iptables -A FORWARD -i ens3 -o wg0 -j ACCEPT
