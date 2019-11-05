#!/usr/bin/python3
# -*- coding: utf-8 -*-
import requests
from bs4 import BeautifulSoup
from pprint import pprint

baseu_url = 'https://cran.r-project.org/web/packages/'

url = 'https://cran.r-project.org/web/packages/sf/index.html'

# Set headers
headers = requests.utils.default_headers()
headers.update({ 'User-Agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0'})

req = requests.get(url, headers)
soup = BeautifulSoup(req.content, 'html.parser')

table = soup.findAll("table", {"summary" : "Package sf summary"})[0]
rows = table.findChildren(['th', 'tr'])
imported_packages_contents = ''
imported_packages_text = ''
imported_packages_cell = ''
sysreq_text = ''
for row in rows:
    cells = row.findChildren('td')
    # Get Import Packages
    if cells[0].string == 'Imports:':
        # Get the text only in the cell e.g. classInt (≥ 0.4-1), DBI (≥ 0.8), graphics, grDevices, grid, magrittr, Rcpp (≥ 0.12.18), stats, tools, units (≥ 0.6-0), utils
        imported_packages_text = cells[1].text
        # The cell object
        imported_packages_cell = cells[1]
    if cells[0].string == 'SystemRequirements:':
        sysreq_text = cells[1].text
        if sysreq_text == '':
            print('May be there is something wrong with the package.')
print(imported_packages_text)
# Build imported packages dictionary
imported_packages = {}
# Split by ', ' to get individual package
imported_packages_text_splitted = imported_packages_text.split(', ')
for i in imported_packages_text_splitted:
    # No space, means it only contains package name
    if ' ' not in i:
        imported_packages[i] = {}
    # If there is a space with bracket, it contains version requirement. e.g. classInt (≥ 0.4-1)
    else:
        # Split the text to get package name and the version requirement
        j = i.split(' (')
        # Add the version
        imported_packages[j[0]] = {'version': j[1][:-1]}

package_urls = imported_packages_cell.findAll('a')
for package_link in package_urls:
    if package_link.string in imported_packages.keys():
        imported_packages[package_link.string]['url'] = baseu_url + package_link['href'][3:]

pprint(imported_packages)
sysreq_text = sysreq_text.replace('\n', ' ')
pprint(sysreq_text)

print('fin')