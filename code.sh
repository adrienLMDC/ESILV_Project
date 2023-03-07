#!/bin/bash 
cd scrapped

curl 'https://www.boursedirect.fr/fr/marche/euronext-paris/cac-40-FR0003500008-PX1-EUR-XPAR/seance' \
  -H 'authority: www.boursedirect.fr' \
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
  -H 'cache-control: max-age=0' \
  -H 'cookie: BDSESSION=9b2d456c39da5b073fc71207f4e5c087; ori=%2Ffr%2Fmarche%2Feuronext-paris%2Fcac-40-FR0003500008-PX1-EUR-XPAR%2Fseance; browser_config=eyJuYW1lIjoiQ2hyb21lIiwidmVyc2lvbiI6IjExMC4wIiwibWluVmVyc2lvbiI6NjEsImlzT2Jzb2xldGUiOmZhbHNlLCJ1c2VyQWdlbnRIYXNoIjoiTVRJNE1qazFNall4TXc9PSJ9; __zlcmid=1EXlcQ955kKGrGf; didomi_token=eyJ1c2VyX2lkIjoiMTg2NzNmMjEtYTUxOS02MWFkLWEwNDAtZDBjMzFhZmFhZDk0IiwiY3JlYXRlZCI6IjIwMjMtMDItMjFUMTI6Mjg6MTQuMjQ4WiIsInVwZGF0ZWQiOiIyMDIzLTAyLTIxVDEyOjI4OjE0LjI0OFoiLCJ2ZW5kb3JzIjp7ImVuYWJsZWQiOlsiZ29vZ2xlIiwiYzpib3Vyc2VkaXItS1R3NmlIN1AiLCJjOmdvb2dsZWFuYS1wWkZYNkhxSyIsImM6YXRpbnRlcm5lLWNXUUtIZUpaIl19LCJwdXJwb3NlcyI6eyJlbmFibGVkIjpbImNvb2tpZXNkZS14UHBVYkJxaCIsImNvb2tpZXNkZS1ROG04QnphOCIsImF1ZGllbmNlbS14ZWRlVTJnUSIsImdlb2xvY2F0aW9uX2RhdGEiLCJkZXZpY2VfY2hhcmFjdGVyaXN0aWNzIl19LCJ2ZW5kb3JzX2xpIjp7ImVuYWJsZWQiOlsiZ29vZ2xlIl19LCJ2ZXJzaW9uIjoyfQ==; euconsent-v2=CPniF8APniF8AAHABBENC4CsAP_AAH_AAAAAGGQEQAFAAgABIAC0AGgARQAmACEAErAKQApQB4gD9AI6AU8BdAC8wGGAXnAMABAACQAGgARQAmACEAFKAP0AjoBTwF0ALzAA.f_gAD_gAAAAA; atauthority=%7B%22name%22%3A%22atauthority%22%2C%22val%22%3A%7B%22authority_name%22%3A%22default%22%2C%22visitor_mode%22%3A%22optin%22%7D%2C%22options%22%3A%7B%22end%22%3A%222024-03-24T12%3A28%3A14.296Z%22%2C%22path%22%3A%22%2F%22%7D%7D; atuserid=%7B%22name%22%3A%22atuserid%22%2C%22val%22%3A%22261c6e32-baa2-4e78-bb8e-13025e82eaee%22%2C%22options%22%3A%7B%22end%22%3A%222024-03-22T12%3A28%3A14.308Z%22%2C%22path%22%3A%22%2F%22%7D%7D; _ga=GA1.2.1296880757.1676982494; _gid=GA1.2.951293637.1676982494; __gads=ID=c04d8427faffcae0:T=1676982492:S=ALNI_MZOg8RHjUQ-eNHAZ9iUbKlzQe1kYQ; __gpi=UID=00000bdd36bb6368:T=1676982492:RT=1676982492:S=ALNI_MZRxDbPRA23Ke5ljpVHmnsB5MxswQ; atidvisitor=%7B%22name%22%3A%22atidvisitor%22%2C%22val%22%3A%7B%22vrn%22%3A%22-570707-%22%7D%2C%22options%22%3A%7B%22path%22%3A%22%2F%22%2C%22session%22%3A34128000%2C%22end%22%3A34128000%7D%7D; io_bd_streaming=jeIEakvT9qhxqLSyAIw5; TS01afa945=010615c678e9aa6f65047aa2a1786a44b347a186ce6ae8170c80eda2021cbd0fe6ad372d03b54ddc5000ef6006917be1280d27e8352ec4d0f2eeb6bb7682cedfbb37ad89a1c1c29b042254a68f22cb57da8b6840b6' \
  -H 'referer: https://www.google.com/' \
  -H 'sec-ch-ua: "Chromium";v="110", "Not A(Brand";v="24", "Google Chrome";v="110"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Windows"' \
  -H 'sec-fetch-dest: document' \
  -H 'sec-fetch-mode: navigate' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-user: ?1' \
  -H 'upgrade-insecure-requests: 1' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36' \
  --compressed > tmp.html

sed -n '/<span class=\"quotation-last bd-streaming-select-value-last\">/,/<\/span>/p' tmp.html | sed -e 's/<[^<>]*>//g' | sed -e 's/&nbsp;//g' | sed 's/        //' | sed 's/\t/ /' | sort -u > test.txt

x=$(date '+%T')
heure=$(echo $x | cut -c1-2)
minute=$(echo $x | cut -c4-5)

if [[  (${heure#0} -le 17 && ${minute#0} -le 30) || (${heure#0} -le 18) ]]; then
                date +%D > date.txt
		date +%T >> cac_value.txt
		sed -n 2p test.txt >> cac_value.txt

fi
