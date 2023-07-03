;
; BIND reverse data file for the local loopback interface
;
$TTL    604800
@       IN      SOA     christianbingman.com. root.christianbingman.com. (
                            1         ; Serial
                        604800         ; Refresh
                        86400         ; Retry
                        2419200         ; Expire
                        604800 )       ; Negative Cache TTL

@       IN      NS      ns1.christianbingman.com.

1       IN      PTR     wolverine.christianbingman.com.
1       IN      PTR     ns1.christianbingman.com.
2       IN      PTR     thor.christianbingman.com.
3       IN      PTR     hulk.christianbingman.com.
4       IN      PTR     ironman.christianbingman.com.
5       IN      PTR     captainamerica.christianbingman.com.
6       IN      PTR     daredevil.christianbingman.com.
7       IN      PTR     nickfury.christianbingman.com.
