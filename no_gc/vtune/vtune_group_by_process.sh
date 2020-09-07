for j in {9..16}
do
    for((i=32;i<=2048;i*=2));
    do
        vtune -report hw-events -r $1${i}m_${j} -group-by process -format csv -report-output $1${i}m_${j}_process.csv
        vtune -report summary -r $1${i}m_${j} -format csv -report-output $1${i}m_${j}_summary.csv
    done
    for i in {4..100..2}
    do
        vtune -report hw-events -r $1${i}g_${j} -group-by process -format csv -report-output $1${i}g_${j}_process.csv
        vtune -report summary -r $1${i}g_${j} -format csv -report-output $1${i}g_${j}_summary.csv
    done
done