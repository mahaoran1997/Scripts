#!/bin/bash

for j in {1..16}
do
    for((i=32;i<=2048;i*=2));
    do
        vtune -collect uarch-exploration -r gpr${i}m_${j} /mnt/ssd/haoran/spark-3.0.0-preview2-bin-hadoop3.2/bin/spark-submit --name "Testgpr${i}m_${j}" --master spark://ZION-8.CS.UCLA.EDU:7277 --conf spark.eventLog.enabled=false --conf "spark.executor.extraJavaOptions=-Xms100g -Xmn${i}m -XX:MetaspaceSize=268435456 -XX:+PrintGCDetails" --class PageRankExample /mnt/ssd/haoran/jars/scala-graphx-pagerank_2.12-2.jar /mnt/ssd/haoran/data/out.wikipedia_link_pl.500m 10
    done
    for i in {4..100..2}
    do
        vtune -collect uarch-exploration -r gpr${i}g_${j} /mnt/ssd/haoran/spark-3.0.0-preview2-bin-hadoop3.2/bin/spark-submit --name "Testgpr${i}g_${j}" --master spark://ZION-8.CS.UCLA.EDU:7277 --conf spark.eventLog.enabled=false --conf "spark.executor.extraJavaOptions=-Xms100g -Xmn${i}g -XX:MetaspaceSize=268435456 -XX:+PrintGCDetails" --class PageRankExample /mnt/ssd/haoran/jars/scala-graphx-pagerank_2.12-2.jar /mnt/ssd/haoran/data/out.wikipedia_link_pl.500m 10
    done
done




#vtune -collect uarch-exploration -r Kmeans${i}m_${j} /mnt/ssd/haoran/spark-3.0.0-preview2-bin-hadoop3.2/bin/spark-submit --name "TestKmeans${i}_${j}" --master spark://ZION-8.CS.UCLA.EDU:7277 --conf spark.eventLog.enabled=false --conf "spark.executor.extraJavaOptions=-Xms100g -Xmn${i}m -XX:MetaspaceSize=268435456 -XX:+PrintGCDetails" --class JavaKMeansExample /mnt/ssd/haoran/jars/kmeans-1.1.jar /mnt/ssd/haoran/data/out.wikipedia_link_pl.440m 4 10

#vtune -collect uarch-exploration -r LR${i}g_${j} /mnt/ssd/haoran/spark-3.0.0-preview2-bin-hadoop3.2/bin/spark-submit --name "TestLR${i}_${j}" --master spark://ZION-8.CS.UCLA.EDU:7277 --conf spark.eventLog.enabled=false --conf "spark.executor.extraJavaOptions=-Xms100g -Xmn${i}g -XX:MetaspaceSize=268435456 -XX:+PrintGCDetails" --class SparkLR /mnt/ssd/haoran/jars/lr_2.12-1.0.jar /mnt/ssd/haoran/data/out.wikipedia_link_pl.210m 10