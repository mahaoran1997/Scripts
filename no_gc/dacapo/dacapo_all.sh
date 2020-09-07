# /mnt/ssd/haoran/TLBTest/test_trade.sh jython large 16 2
# /mnt/ssd/haoran/TLBTest/test_trade.sh tomcat huge 32 4
# /mnt/ssd/haoran/TLBTest/test_trade.sh tradesoap huge 96 8
# /mnt/ssd/haoran/TLBTest/test_trade.sh tradebeans huge 64 4
/mnt/ssd/haoran/TLBTest/dacapo_onecpu.sh h2 huge 32 4
/mnt/ssd/haoran/TLBTest/dacapo_onecpu.sh tomcat huge 40 4
mv /mnt/ssd/haoran/perf_dacapo/tomcat /mnt/ssd/haoran/perf_dacapo/tomcat_single
mkdir /mnt/ssd/haoran/perf_dacapo/tomcat
/mnt/ssd/haoran/TLBTest/test_trade.sh tomcat huge 36 4