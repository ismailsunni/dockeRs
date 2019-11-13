with open('./spatial_packages.txt','r') as f:
    packages = f.read().splitlines()
with open('./spatiotemporal_packages.txt','r') as f:
    packages += f.read().splitlines()
packages = set(packages)  # Remove duplication
packages = sorted(packages)

for p in packages:
    print('RUN R -e "install.packages(\'%s\')"' % p)
