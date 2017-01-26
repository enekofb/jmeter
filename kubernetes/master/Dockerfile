FROM enekofb/jmeter:base

ADD files /

RUN ["chmod", "+x", "/run-jmeter-test.sh"]

CMD ["/run-jmeter-test.sh","10","1","host","8080","/health"]