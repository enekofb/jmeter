FROM enekofb/jmeter:base

ADD files /

RUN ["chmod", "+x", "/run-jmeter-test.sh"]

CMD ["/run-jmeter-test.sh","10","1","minion00-k8s1.ci1.peng.gb-lon1.metroscales.io","30001","/health"]