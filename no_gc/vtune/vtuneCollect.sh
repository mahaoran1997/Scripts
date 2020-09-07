#! /bin/bash

echo "Specific the log file name by 1st parameter,or print in screen"

#pmu event

PMUEvent="INST_RETIRED.ANY,CPU_CLK_UNHALTED.THREAD"


#get the CoarseGrainedExecutor Id
executorId=""
while [ -z "$executorId" ]
do
  executorId=` jps | grep CoarseGrainedExecutorBackend | sed -n "s/ CoarseGrainedExecutorBackend//p"`
done
echo "perf executor: $executorId"

logFile=$1

if [ -z "$logFile" ]
then
  echo "Print in screen "
  echo "pid${executorId}" 
  amplxe-cl -data-limit=0   -target-pid=${executorId}  -collect-with runsa   -knob event-config=${PMUEvent} 
else
  echo "dump in ${logFile}"
  echo -e "\n\n\n" >> ${logFile}
  echo "pid${executorId}" >> ${logFile}
  amplxe-cl -data-limit=0   -target-pid=${executorId}  -collect-with runsa  -knob event-config=${PMUEvent} >> ${logFile} 2>&1 
fi









