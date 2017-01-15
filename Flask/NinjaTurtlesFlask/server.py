from flask import Flask, render_template, session, request, redirect

app = Flask(__name__)
app.secret_key = 'secretshhhh!!!'

colors = {
	'blue': 'leonardo',
	'red': 'raphael',
	'purple': 'donatello',
	'orange': 'michelangelo'
}

@app.route('/')
def index():
	return render_template('index.html')

@app.route('/ninja')
def Ninjas():
	ninjas = []
	for key in colors:
		ninjas.append(colors[key])
	return render_template('ninjas.html', ninjas=ninjas)

@app.route('/ninja/<ninjaColor>')
def ninja(ninjaColor):
	ninjas = []
	if ninjaColor in colors:
		ninjas.append(colors[ninjaColor])
	else:
		ninjas.append('notApril')
	return render_template('ninjas.html', ninjas=ninjas)

app.run(debug = True)