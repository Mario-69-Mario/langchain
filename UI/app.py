from flask import Flask, render_template, request, jsonify

app = Flask(__name__)

def send_to_langchain(message):
    # Simulating sending the message to Langchain and getting a response.
    # Replace this code with actual interaction with Langchain.
    response = "Received: " + message
    return response

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/send', methods=['POST'])
def send():
    message = request.form['message']
    reply = send_to_langchain(message)
    return jsonify(reply=reply)

if __name__ == '__main__':
    app.run(debug=True)
