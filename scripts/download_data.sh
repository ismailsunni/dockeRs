wget -O aq_links.txt "https://fme.discomap.eea.europa.eu/fmedatastreaming/AirQualityDownload/AQData_Extract.fmw?CountryCode=DE&CityName=&Pollutant=8&Year_from=2017&Year_to=2017&Station=&Samplingpoint=&Source=E1a&Output=TEXT&UpdateDate="
wget -i aq_links.txt
find . -name "DE*csv" -type f -print0 | xargs -0 dos2unix