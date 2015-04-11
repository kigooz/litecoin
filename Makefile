EARTHDOLLARD=EarthDollard
EARTHDOLLARGUI=EarthDollar-qt
EARTHDOLLARCLI=EarthDollard
B1_FLAGS=
B2_FLAGS=
B1=-datadir=1 $(B1_FLAGS)
B2=-datadir=2 $(B2_FLAGS)
BLOCKS=1
ADDRESS=
AMOUNT=
ACCOUNT=

start:
	$(EARTHDOLLARD) $(B1) -daemon
	$(EARTHDOLLARD) $(B2) -daemon

generate:
	$(EARTHDOLLARCLI) $(B1) setgenerate true

generatestop:
	$(EARTHDOLLARCLI) $(B1) setgenerate false

getinfo:
	$(EARTHDOLLARCLI) $(B1) getinfo
	$(EARTHDOLLARCLI) $(B2) getinfo

send:
	$(EARTHDOLLARCLI) $(B1) sendtoaddress $(ADDRESS) $(AMOUNT)

address:
	$(EARTHDOLLARCLI) $(B1) getnewaddress $(ACCOUNT)

stop:
	$(EARTHDOLLARCLI) $(B1) stop
	$(EARTHDOLLARCLI) $(B2) stop

clean:
	find 1/regtest/* -not -name 'server.*' -delete
	find 2/regtest/* -not -name 'server.*' -delete
