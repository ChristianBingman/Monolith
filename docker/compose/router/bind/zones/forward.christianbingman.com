;
; BIND data file for the local loopback interface
;
$TTL    604800
@       IN      SOA     christianbingman.com. root.christianbingman.com. (
                            2         ; Serial
                        604800         ; Refresh
                        86400         ; Retry
                        2419200         ; Expire
                        604800 )       ; Negative Cache TTL

@       IN      NS      ns1.christianbingman.com.

wolverine IN    A       10.0.0.1
ns1       IN    A       10.0.0.1
thor      IN    A       10.0.0.2
hulk      IN    A       10.0.0.3
ironman   IN    A       10.0.0.4
captainamerica IN A     10.0.0.5
daredevil IN    A       10.0.0.6
nickfury  IN    A       10.0.0.7
