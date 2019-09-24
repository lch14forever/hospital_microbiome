import sys


cluster_file = sys.argv[1]
non_novel_file = sys.argv[2]
output = sys.argv[3]
non_novel_genome = []
non_novel_cluster = {}

with open(non_novel_file, "r") as fr:
    for line in fr:
        genome = "_".join(line.strip().split("/")[-2:])[:-3]
        non_novel_genome.append(genome)

        
with open(cluster_file, "r") as fr:
    for line in fr:

        if line.split()[0].replace("\"", "") == "clusters":
            continue
       
        (genome, cluster) = line.strip().split()
        genome = genome.replace("\"", "")
        if genome in non_novel_genome:
            non_novel_cluster[cluster] = 1

with open(cluster_file, "r") as fr, open(output, "w") as fw:
    for line in fr:
        if line.split()[0].replace("\"", "") == "clusters":
            fw.write(line)
            continue
        (genome, cluster) = line.strip().split()
        if cluster in non_novel_cluster:
            continue
        fw.write(line)
        
