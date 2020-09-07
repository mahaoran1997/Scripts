for j in {1..8}
do
    for((i=32;i<=2048;i*=2));
    do
        rm -r /mnt/ssd/haoran/perf_dacapo/scratch
        perf stat -o /mnt/ssd/haoran/perf_dacapo/$1/$1${i}m_${j}.out -e dTLB-load-misses,dTLB-store-misses,LLC-load-misses,LLC-loads,LLC-store-misses,LLC-stores,mem_uops_retired.stlb_miss_loads,mem_uops_retired.stlb_miss_stores,dtlb_load_misses.walk_duration,dtlb_store_misses.walk_duration,L1-dcache-load-misses,L1-dcache-stores,L1-dcache-stores,L1-dcache-stores,dtlb_store_misses.miss_causes_a_walk,mem_load_uops_retired.l1_hit,mem_load_uops_retired.l1_miss,mem_load_uops_retired.l2_hit,mem_load_uops_retired.l2_miss,mem_load_uops_retired.l3_hit,mem_load_uops_retired.l3_miss,mem_uops_retired.all_loads,mem_uops_retired.all_stores,mem_load_uops_l3_hit_retired.xsnp_hit,mem_load_uops_l3_hit_retired.xsnp_hitm,mem_load_uops_l3_hit_retired.xsnp_miss,mem_load_uops_retired.hit_lfb,cpu-cycles,instructions,page-faults,INST_RETIRED.PREC_DIST,INST_RETIRED.ANY taskset -c 0 /mnt/ssd/haoran/jdk-12.0.2/bin/java -Xms$3g -Xmx$3g -Xmn${i}m -XX:MetaspaceSize=268435456 -XX:+PrintGCDetails -XX:+UseG1GC -XX:+DisableExplicitGC -XX:ConcGCThreads=0 -XX:G1ConcRefinementThreads=0 -jar /mnt/ssd/haoran/dacapo-9.12-MR1-bach.jar $1 -s $2 > /mnt/ssd/haoran/perf_dacapo/$1/$1${i}m_${j}.gc 2>/mnt/ssd/haoran/perf_dacapo/$1/$1${i}m_${j}.stderr
    done
    for((i=4;i<=$3;i+=$4));
    do
        rm -r /mnt/ssd/haoran/perf_dacapo/scratch
        perf stat -o /mnt/ssd/haoran/perf_dacapo/$1/$1${i}g_${j}.out -e dTLB-load-misses,dTLB-store-misses,LLC-load-misses,LLC-loads,LLC-store-misses,LLC-stores,mem_uops_retired.stlb_miss_loads,mem_uops_retired.stlb_miss_stores,dtlb_load_misses.walk_duration,dtlb_store_misses.walk_duration,L1-dcache-load-misses,L1-dcache-stores,L1-dcache-stores,L1-dcache-stores,dtlb_store_misses.miss_causes_a_walk,mem_load_uops_retired.l1_hit,mem_load_uops_retired.l1_miss,mem_load_uops_retired.l2_hit,mem_load_uops_retired.l2_miss,mem_load_uops_retired.l3_hit,mem_load_uops_retired.l3_miss,mem_uops_retired.all_loads,mem_uops_retired.all_stores,mem_load_uops_l3_hit_retired.xsnp_hit,mem_load_uops_l3_hit_retired.xsnp_hitm,mem_load_uops_l3_hit_retired.xsnp_miss,mem_load_uops_retired.hit_lfb,cpu-cycles,instructions,page-faults,INST_RETIRED.PREC_DIST,INST_RETIRED.ANY taskset -c 0 /mnt/ssd/haoran/jdk-12.0.2/bin/java -Xms$3g -Xmx$3g -Xmn${i}g -XX:+UseG1GC -XX:MetaspaceSize=268435456 -XX:+PrintGCDetails -XX:+DisableExplicitGC -XX:ConcGCThreads=0 -XX:G1ConcRefinementThreads=0 -jar /mnt/ssd/haoran/dacapo-9.12-MR1-bach.jar $1 -s $2 > /mnt/ssd/haoran/perf_dacapo/$1/$1${i}g_${j}.gc 2>/mnt/ssd/haoran/perf_dacapo/$1/$1${i}g_${j}.stderr
    done
    rm -r /mnt/ssd/haoran/perf_dacapo/scratch
    perf stat -o /mnt/ssd/haoran/perf_dacapo/$1/$1eps_${j}.out -e dTLB-load-misses,dTLB-store-misses,LLC-load-misses,LLC-loads,LLC-store-misses,LLC-stores,mem_uops_retired.stlb_miss_loads,mem_uops_retired.stlb_miss_stores,dtlb_load_misses.walk_duration,dtlb_store_misses.walk_duration,L1-dcache-load-misses,L1-dcache-stores,L1-dcache-stores,L1-dcache-stores,dtlb_store_misses.miss_causes_a_walk,mem_load_uops_retired.l1_hit,mem_load_uops_retired.l1_miss,mem_load_uops_retired.l2_hit,mem_load_uops_retired.l2_miss,mem_load_uops_retired.l3_hit,mem_load_uops_retired.l3_miss,mem_uops_retired.all_loads,mem_uops_retired.all_stores,mem_load_uops_l3_hit_retired.xsnp_hit,mem_load_uops_l3_hit_retired.xsnp_hitm,mem_load_uops_l3_hit_retired.xsnp_miss,mem_load_uops_retired.hit_lfb,cpu-cycles,instructions,page-faults,INST_RETIRED.PREC_DIST,INST_RETIRED.ANY taskset -c 0 /mnt/ssd/haoran/jdk-12.0.2/bin/java -Xms$3g -Xmx$3g -XX:+UnlockExperimentalVMOptions -XX:+UseEpsilonGC -XX:MetaspaceSize=268435456 -XX:+PrintGCDetails -XX:+DisableExplicitGC -jar /mnt/ssd/haoran/dacapo-9.12-MR1-bach.jar $1 -s $2 > /mnt/ssd/haoran/perf_dacapo/$1/$1eps_${j}.gc 2>/mnt/ssd/haoran/perf_dacapo/$1/$1eps_${j}.stderr
done


#1 benchmark
#2 input size
#3 heap size
#4 young gen step



#h2 huge 32 4
#jython large 16 2
#tomcat huge 40 4
#tradebeans huge 64 4
#tradesoap huge 96 8




#h2 32