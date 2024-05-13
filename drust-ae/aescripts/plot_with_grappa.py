import matplotlib
import matplotlib.pyplot as plt
import pandas as pd
import sys



colors = [
    ["#3852A4", "#2D2B44", "#366897", "#859EB0"], # blue
    ["#7E479C", "#4D3763", "#624B78", "#8F709A"], # purple
    ["#00A99C", "#29503B", "#569F93", "#99C5AD"], # cyan
    ["#F37A20", "#C66228", "#F89D2D", "#FDBF4F"]  # yellow
]

matplotlib.rcParams['pdf.fonttype'] = 42
matplotlib.rcParams['ps.fonttype'] = 42

ReadFromBaseline = True

if len(sys.argv) > 2:
    if len(sys.argv) == 3 and sys.argv[2] == 'all':
        ReadFromBaseline = False
    else:
        print("Invalid input format!")
        exit(-1)

fs = []
fst = []
tp = []
tpt = []

def bold(str):
    return r"$\bf{" + str + r"}$"

app = sys.argv[1]
log_folder = "/mnt/ssd/guest/DRust_home/logs/"
baseline_log_folder = "/mnt/ssd/guest/DRust_home/logs/baseline/"

def in_gigabytes(x, pos):
    return '{:d}'.format(int(x * 1e-3))

def read_from_csv(filename):
    data = pd.read_csv(filename, delim_whitespace=True, names=['data'])
    return [float(i) for i in data['data']]

def read_from_files(sysname, from_baseline=False):
    results = []
    local_log_folder = baseline_log_folder if from_baseline else log_folder
    for i in range(8):
        file_name = local_log_folder + app + '_' + sysname + '_' + str(i+1) + '.txt'
        file = open(file_name, 'r')
        time = float(file.readline())
        results.append(time)
        file.close()
    return results

def read_from_file(sysname, from_baseline=False):
    results = []
    local_log_folder = baseline_log_folder if from_baseline else log_folder
    file_name = local_log_folder + app + '_' + sysname + '.txt'
    file = open(file_name, 'r')
    time = float(file.readline())
    for i in range(8):
        results.append(time)
    file.close()
    return results

if app == 'sn':
    singletime = read_from_files('single', ReadFromBaseline)
else:
    singletime = read_from_file('single', ReadFromBaseline)
gamtime = read_from_files('gam', ReadFromBaseline)
grappatime = read_from_files('grappa', ReadFromBaseline)
drusttime = read_from_files('drust')
fx = read_from_csv('/mnt/ssd/guest/DRust_home/aescripts/nodenum.csv')


base = singletime[0]
for i in range(8):
    # grappatime[i] = base / grappatime[i]
    gamtime[i] = base / gamtime[i]
    drusttime[i] = base / drusttime[i]
    singletime[i] = base / singletime[i]
    grappatime[i] = base / grappatime[i]


# print(gamtime)
print(drusttime)

fig, ax = plt.subplots()

marker_size = 16

plt.plot(fx, drusttime, marker='o', markersize=marker_size,  label=bold('Drust'), color=colors[2][0])
plt.plot(fx, gamtime, marker='*', markersize=marker_size, label=bold('GAM'), color=colors[3][1])
plt.plot(fx, grappatime, marker="x", markersize=marker_size, label=bold('Grappa'), color=colors[3][0])
# plt.plot(fx, grappatime, marker="x", markersize=marker_size, label=bold('Grappa'), color=colors[3][0])
if app == 'sn':
    plt.plot(fx, singletime, marker="v", markersize=marker_size, linestyle="dotted", label=bold('Original'), color=colors[2][1])
else:
    plt.plot(fx, singletime, linestyle="dotted", label=bold('Original'), color=colors[2][1])


# ax.yaxis.set_major_formatter(in_gigabytes)
# if app == 'kv':
#     ax.set_ylabel('Throughput (Mops/s)', fontsize=20)
# else:
ax.set_ylabel('Normalized Throughput', fontsize=20)
plt.yticks(fontsize=20)
plt.xticks(fontsize=20)
ax.set_xlabel('Number of Nodes', fontsize=20)
#ax.margins(0.1)

plt.xlim(0, 9)
plt.ylim(0)

if app == 'sn':
    title = bold('SocialNet')
elif app == 'kv':
    title = bold('KVStore')
elif app == 'dataframe':
    title = bold('Dataframe')
elif app == 'gemm':
    title = bold('GEMM')

plt.title(title, fontsize='large')
plt.legend(fontsize=14)
fig.set_size_inches(7,5)
fig.tight_layout()
plt.savefig('/mnt/ssd/guest/DRust_home/aescripts/figures/'+app+'_performance.pdf')

# plt.show()