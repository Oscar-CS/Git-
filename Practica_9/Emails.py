#!/usr/bin/python

def main ():

    from email.mime.multipart import MIMEMultipart
    from email.mime.text import MIMEText
    import smtplib
    import json

    data = {}

    with open('pass.json') as file:
        data = json.load(file)
    # create message object instance
    msg = MIMEMultipart()

    message = "FCFM!"

    # setup the parameters of the message

    j = 0       # iterator for each user to receive the message
    for user in data['information']:
        msg['From'] = user['user']
        msg['To'] = user['recepter'][j]
        msg['Subject'] = "This Is A Test!"
    
        # add in the message body
        msg.attach(MIMEText(message, 'plain'))
    
        # create server
        server = smtplib.SMTP(user['server'])
        server.starttls()
        # Login Credentials for sending the mail
        server.login(user['user'], user['password'])
        # send the message via the server.
        server.sendmail(msg['From'], msg['To'], msg.as_string())
        server.quit()

        print("successfully sent email to %s:" % (msg['To']))
        j += 1

if __name__ == "__main__":
    main()