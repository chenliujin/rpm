#!/usr/bin/env python
# -*- coding: utf-8;

"""
smtp="/opt/rawlog/sh/smtp.py"
subject="test"
mail_list="liujin.chen@qq.com"
smtp_server=""
smtp_port="2525"
smtp_user=""
smtp_passwd=""
smtp_sender=""
mail_cmd="$smtp --ttl -H $smtp_server -P $smtp_port -u $smtp_user -p $smtp_passwd --subject=$subject -f \"$smtp_sender\" -t \"$mail_list\" -a $msg"
$mail_cmd
"""

import sys,re,optparse
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText


def main():
	usage = "usage %prog [options]"
	parser = optparse.OptionParser(usage)
	parser.add_option("-H", "--hostname", action="store", type="string", help="Hostname or IP address of the SMTP server")
	parser.add_option("-u", "--user", action="store", type="string", help="User name for authenating on the SMTP server")
	parser.add_option("-p", "--passwd", action="store", type="string", help="Password for authenating on the SMTP server")
	parser.add_option("-P", "--port", action="store", type="string", default="25", help="Specify a port number for the SMTP server")
	
	parser.add_option("-s", "--subject", action="store", type="string", help="Mail Subject")
	parser.add_option("-f", "--sender", action="store", type="string", help="The sender's address")
	parser.add_option("-t", "--recipients", action="store", type="string", help="The list of recipients' addresses with double quotes , e.g.: \"peter@hotmail.com, mike@gmail.com, tracy@yahoo.com\"")
	parser.add_option("-a", "--attach", action="append", type="string", help="The file path of a plain text attachement")
	parser.add_option("-m", "--message", action="store", type="string", help="A line of simple message of the mail")
	parser.add_option("-e", "--msg-file", action="store", type="string", help="A file path of the message file")
	parser.add_option("-l", "--ttl", action="store_true", help="Use SSL/TLS to send notifications over SMTP")
	
	(options, args) = parser.parse_args()

	# print options


	"""
	TODO DON'T forget to add the validation logic for the options here...
	"""


	message = MIMEMultipart()
	message['Subject'] = options.subject
	message['From'] =  options.sender
        message['To'] = options.recipients.replace(',',' ')

	for filepath in options.attach:
		fhandle = open(filepath)
		textAttachment = MIMEText(fhandle.read())
		message.attach(textAttachment)

	#print message

	smtp = smtplib.SMTP(options.hostname, options.port)

        if options.ttl:
           smtp.ehlo()
           if not smtp.esmtp_features.has_key('starttls'):
		raise Exception('TLS enabled but server does not support')
           smtp.starttls()
           smtp.ehlo()
 
	smtp.login(options.user.encode('utf-8'), options.passwd.encode('utf-8'))
	smtp.sendmail(options.sender, options.recipients.split(','), message.as_string())

        if options.ttl:
           import socket
           try:
              smtp.quit()
           except socket.sslerror:
              pass
        else:
	   smtp.quit()


if __name__ == '__main__':
	main()
