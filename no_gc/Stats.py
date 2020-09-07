# # started on Mon Aug 17 19:32:35 2020


#  Performance counter stats for '/home/haoran/spark-3.0.0-preview2-bin-hadoop3.2/bin/spark-submit --name TestLR12g_26 --master spark://ZION-5.CS.UCLA.EDU:7277 --conf spark.eventLog.enabled=false --conf spark.executor.extraJavaOptions=-Xms32g -Xmn12g -XX:MetaspaceSize=268435456 -XX:+PrintGCDetails --class SparkLR /home/haoran/data/LR/target/scala-2.12/lr_2.12-1.0.jar /home/haoran/data/pagerank/out.80m 10':

#           46803959      dTLB-load-misses:u                                            (24.27%)
#            4641668      dTLB-store-misses:u                                           (27.68%)
#           49035890      LLC-load-misses:u         #   11.57% of all LL-cache hits     (31.08%)
#          423771621      LLC-loads:u                                                   (31.05%)
#           16510579      LLC-store-misses:u                                            (6.84%)
#           64818287      LLC-stores:u                                                  (6.84%)
#           20650405      mem_uops_retired.stlb_miss_loads:u                                     (10.29%)
#            1874600      mem_uops_retired.stlb_miss_stores:u                                     (13.72%)
#         1217613580      dtlb_load_misses.walk_duration:u                                     (17.24%)
#          113709242      dtlb_store_misses.walk_duration:u                                     (20.72%)
#         1085616681      L1-dcache-load-misses:u                                       (24.20%)
#         7458637641      L1-dcache-stores:u                                            (27.65%)
#         7477801981      L1-dcache-stores:u                                            (27.63%)
#         7481984615      L1-dcache-stores:u                                            (24.18%)
#            4722423      dtlb_store_misses.miss_causes_a_walk:u                                     (27.61%)
#        19473741089      mem_load_uops_retired.l1_hit:u                                     (27.61%)
#          574868284      mem_load_uops_retired.l1_miss:u                                     (17.08%)
#          319231891      mem_load_uops_retired.l2_hit:u                                     (17.14%)
#          251688446      mem_load_uops_retired.l2_miss:u                                     (17.19%)
#          226084538      mem_load_uops_retired.l3_hit:u                                     (13.80%)
#           22946579      mem_load_uops_retired.l3_miss:u                                     (13.89%)
#        20722990043      mem_uops_retired.all_loads:u                                     (13.87%)
#         7439168203      mem_uops_retired.all_stores:u                                     (13.85%)
#             350944      mem_load_uops_l3_hit_retired.xsnp_hit:u                                     (13.82%)
#             947913      mem_load_uops_l3_hit_retired.xsnp_hitm:u                                     (13.81%)
#             964298      mem_load_uops_l3_hit_retired.xsnp_miss:u                                     (13.88%)
#          447567135      mem_load_uops_retired.hit_lfb:u                                     (13.93%)
#        48941806493      cpu-cycles:u                                                  (17.39%)
#        64602279444      instructions:u            #    1.32  insn per cycle           (20.83%)
#             247443      page-faults:u                                               

#       13.974881344 seconds time elapsed

#       22.373822000 seconds user
#        2.160883000 seconds sys





# # started on Sat Aug 15 21:58:12 2020


#  Performance counter stats for '/home/haoran/spark-3.0.0-preview2-bin-hadoop3.2/bin/spark-submit --name TestSpark32g_3 --master spark://ZION-5.CS.UCLA.EDU:7277 --conf spark.eventLog.enabled=false --conf spark.executor.extraJavaOptions=-Xms32g -Xmn32g -XX:MetaspaceSize=268435456 -XX:+PrintGCDetails --class PageRankExample /home/haoran/data/graphpage/scala-graphx-pagerank_2.12-2.jar /home/haoran/data/pagerank/out.150m 10':

#           48363503      dTLB-load-misses:u                                            (18.48%)
#            5399845      dTLB-store-misses:u                                           (22.21%)
#           40650253      LLC-load-misses:u         #    9.23% of all LL-cache hits     (25.94%)
#          440353635      LLC-loads:u                                                   (29.60%)
#           15571203      LLC-store-misses:u                                            (7.38%)
#           87485060      LLC-stores:u                                                  (7.44%)
#           19725909      mem_uops_retired.stlb_miss_loads:u                                     (11.15%)
#            1795909      mem_uops_retired.stlb_miss_stores:u                                     (14.95%)
#         1059533102      dtlb_load_misses.walk_duration:u                                     (18.62%)
#          109453453      dtlb_store_misses.walk_duration:u                                     (22.35%)
#         1152931022      L1-dcache-load-misses:u                                       (26.03%)
#         8231748821      L1-dcache-stores:u                                            (29.70%)
#         8267790707      L1-dcache-stores:u                                            (29.67%)
#         8323895603      L1-dcache-stores:u                                            (25.94%)
#            5030959      dtlb_store_misses.miss_causes_a_walk:u                                     (29.63%)
#        22000025613      mem_load_uops_retired.l1_hit:u                                     (29.56%)
#          574217375      mem_load_uops_retired.l1_miss:u                                     (18.50%)
#          306874017      mem_load_uops_retired.l2_hit:u                                     (18.59%)
#          254629415      mem_load_uops_retired.l2_miss:u                                     (18.63%)
#          203216672      mem_load_uops_retired.l3_hit:u                                     (14.89%)
#           18290247      mem_load_uops_retired.l3_miss:u                                     (14.86%)
#        22844261921      mem_uops_retired.all_loads:u                                     (14.73%)
#         8267793880      mem_uops_retired.all_stores:u                                     (14.69%)
#            6716528      mem_load_uops_l3_hit_retired.xsnp_hit:u                                     (14.74%)
#           16265012      mem_load_uops_l3_hit_retired.xsnp_hitm:u                                     (14.81%)
#             931441      mem_load_uops_l3_hit_retired.xsnp_miss:u                                     (14.83%)
#          459547710      mem_load_uops_retired.hit_lfb:u                                     (14.78%)

#       31.010549784 seconds time elapsed

#       25.261363000 seconds user
#        2.301439000 seconds sys

import csv
import os



app = "LR"
stats = [{}]
columns = []
times = 32;


with open(app+"_perf_stats.csv","w") as csvfile:
    writer = csv.writer(csvfile)
    for i in range(1,33):
        stats.append({})
        for j in range(1,times+1):
            f = open("/home/haoran/perf_results/"+app+str(i)+"g_"+str(j)+".out")
            lines = f.readlines()
            for line_num in range(5,35):
                words = lines[line_num].split()
                # if(len(columns) < 28):
                #     columns.append(words[1])
                if words[1] not in stats[i]:
                    stats[i][words[1]] = 0;
                stats[i][words[1]] += int(words[0])
            words = lines[36].split()
            if words[1] not in stats[i]:
                stats[i][words[1]] = 0.0;
            stats[i][words[1]] += float(words[0])
            f.close()
        if i == 1:
            for id in stats[i]:
                columns.append(id)
            writer.writerow(columns)
        output = []
        for id in stats[i]:
            output.append(stats[i][id]/float(times))
        writer.writerow(output)
    

