#!bin/python3

import pandas as pd
from dash import Dash, dcc, html, Output, Input
import plotly
import plotly.graph_objects as go
import plotly.express as px

app = Dash(__name__)

app.layout = html.Div([
		html.H1('Projet de Git Python and Linux for Financial Engineering '),
		html.H2("Evolution de la valeur du CAC40 en temps réel"),
		dcc.Graph(id='CAC40_Graph') ,
		dcc.Interval(id='interval_component',
			     disabled = False,
			     interval=300*1000,
			     n_intervals= 0),

	html.Div([
		html.H3('Statistiques de la journée'),
		html.Div([ html.P(['Le plus haut : ',
			html.Var(id = 'HIGH') ]) ]) ,
		html.Div([html.P(['Le plus bas : ',
                        html.Var(id = 'LOW') ])]),
		html.P(['Ouverture : ',
                        html.Var(id = 'OPEN') ]),
		html.P(['Fermeture : ',
                        html.Var(id = 'CLOSE') ])
	 ])
    ])

@app.callback(Output('CAC40_Graph', 'figure'),
	      Output('HIGH', 'children'),
	      Output('LOW', 'children'),
	      Output('CLOSE', 'children'),
	      Output('OPEN', 'children'),
	[Input('interval_component', 'n_intervals')])

def update_graph(num):
	fichier = open("cac_value.txt", "r")
	fichierdate = open("date.txt", "r")
	for line in fichierdate:
		date = line.rstrip('\n')
	data = []
	for line in fichier :
        	data.append(line)
	fichier.close()
	valeur = []
	heure = []
	maxi = -1000
	mini = 10000000
	openvalue = float(data[1])

	for i in range(len(data)):
		if(i%2 != 0):
			valeur.append(float(data[i]))
			if(maxi < float(data[i])):
				maxi = float(data[i])
			if(mini > float(data[i])):
				mini = float(data[i])
		else:
			heure.append(data[i])
			if(data[i] >= '17:29:00'):
				close = float(data[i+1])
			else:
				close = '-'
	variation = round(100*(valeur[len(valeur)-1]/openvalue - 1), 3)
	return px.line(x=heure, y=valeur,labels={'x': '', 'y':''}, title=('CAC 40 : ' + str(valeur[len(valeur)-1])) + '    '+ str(variation) + '%'), maxi, mini, close, openvalue

if __name__ == "__main__":
    app.run_server(host='0.0.0.0', port='8050', debug=True)




