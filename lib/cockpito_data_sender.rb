#!/usr/bin/env ruby
# # Data Sender Class For Cockpito
#
# This class sends the defined data to the Cockpito
# server with UDP protocol. It's pretty fast.
#
# (c)Copyright Cockpito.com
# All rights reserved.
#
# http://cockpito.com/
# hello@cockpito.com
# @cockpito
#
# For questions, answers and discussions, come and
# visit our Q&A page at:
# http://cockpito.com/questions/
#
# You can browse Cockpito open-source SDKs on our Github
# repositories:
#
# https://github.com/organizations/cockpito
#
# -----------------------------------------------------
#
# Here`s examle of using it:
#   load 'cockpito_data_sender.rb'
#   c = CockpitoDataSender.new('127.0.0.1',1234)
#   c.increment('test.metric', 1) # it returns the number of bytes sent
require 'socket'

class CockpitoDataSender #sends data via UDP protocol
  def initialize(host = '0.0.0.0',port = 2322)
    @host = host # Cockpito server IP
    @port = port # listening port
  end
public
  def increment(key,amount)
    send(key,amount,false)
  end
  def decrement(key,amount)
    send(key,amount,true)
  end
private
  def send(key,amount,decrement = false)
    s = UDPSocket.new # create UDP socket to send
    begin
    s.connect(@host, @port) # connects to Cockpito server
    msg = (decrement == false ? 'increment' : 'decrement') +
      '|' + key.to_s + '|' + amount.to_s + "\n"
    s.send(msg, 0)
    rescue
      puts "Error: #{$!.inspect.to_s}"
    end
  end
end
