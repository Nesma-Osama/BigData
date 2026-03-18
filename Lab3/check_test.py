path1 = '/home/mohamed-ashraf/Desktop/projects/labs/BigData/Lab3/output/output.txt'
path2 = '/home/mohamed-ashraf/Desktop/projects/labs/BigData/Lab2/VodafoneLab/output.txt'

with open(path1, 'r') as f1, open(path2, 'r') as f2:
    content1 = list(f1.read().split('\n'))
    content2 = list(f2.read().split('\n'))

cnt1 = {}
cnt2 = {}

for line in content1:
    if line.strip():
        key = int(line.split(",")[0])
        cnt1[key] = int(line.split(",")[1])

for line in content2:
    if line.strip():
        key = int(line.split("\t")[0])
        cnt2[key] = int(line.split("\t")[1])

cnt1 = dict(sorted(cnt1.items()))
cnt2 = dict(sorted(cnt2.items()))

if cnt1 == cnt2:
    print("The contents of the two files match.")
else:
    print("The contents of the two files do not match.")
