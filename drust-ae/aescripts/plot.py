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

fs = []
fst = []
tp = []
tpt = []

def bold(str):
    return r"$\bf{" + str + r"}$"

app = sys.argv[1]
log_folder = "/mnt/ssd/guest/DRust_home/logs/"

def in_gigabytes(x, pos):
    return '{:d}'.format(int(x * 1e-3))

def read_from_csv(filename):
    data = pd.read_csv(filename, delim_whitespace=True, names=['data'])
    return [float(i) for i in data['data']]

def read_from_files(sysname):
    results = []
    for i in range(8):
        file_name = log_folder + app + '_' + sysname + '_' + str(i+1) + '.txt'
        file = open(file_name, 'r')
        time = float(file.readline())
        results.append(time)
        file.close()
    return results

def read_from_file(sysname):
    results = []
    file_name = log_folder + app + '_' + sysname + '.txt'
    file = open(file_name, 'r')
    time = float(file.readline())
    for i in range(8):
        results.append(time)
    file.close()
    return results

singletime = read_from_file('single')
# gamtime = read_from_files('gam')
drusttime = read_from_files('drust')
fx = read_from_csv('/mnt/ssd/guest/DRust_home/aescripts/nodenum.csv')



for i in range(8):
    # grappatime[i] = grappatime[i] / singletime[0]
    # gamtime[i] = gamtime[i] / singletime[0]
    drusttime[i] = singletime[0] / drusttime[i]
for i in range(1, len(singletime)):
    singletime[i] = singletime[i] / singletime[0]
singletime[0] = 1


# print(gamtime)
print(drusttime)

fig, ax = plt.subplots()

plt.plot(fx, drusttime, marker='o', markersize=8,  label=bold('Drust'), color=colors[2][0])
# plt.plot(fx, gamtime, marker='*', markersize=8, label=bold('GAM'), color=colors[3][1])
# plt.plot(fx, grappatime, marker="x", markersize=8, label=bold('Grappa'), color=colors[3][0])
if app == 'sn':
    plt.plot(fx, singletime, marker="v", markersize=8, linestyle="dotted", label=bold('Original'), color=colors[2][1])
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
plt.ylim(0, 8)

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
fig.set_size_inches(5,4.5)
fig.tight_layout()
plt.savefig('/mnt/ssd/guest/DRust_home/aescripts/figures/'+app+'_performance.pdf')

# plt.show()