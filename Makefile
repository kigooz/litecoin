LITECOIND=litecoind
LITECOINGUI=litecoin-qt
LITECOINCLI=litecoind
B1_FLAGS=
B2_FLAGS=
B1=-datadir=1 $(B1_FLAGS)
B2=-datadir=2 $(B2_FLAGS)
BLOCKS=1
ADDRESS=
AMOUNT=
ACCOUNT=

start:
	$(LITECOIND) $(B1) -daemon
	$(LITECOIND) $(B2) -daemon

generate:
	$(LITECOINCLI) $(B1) setgenerate true

generatestop:
	$(LITECOINCLI) $(B1) setgenerate false

getinfo:
	$(LITECOINCLI) $(B1) getinfo
	$(LITECOINCLI) $(B2) getinfo

send:
	$(LITECOINCLI) $(B1) sendtoaddress $(ADDRESS) $(AMOUNT)

address:
	$(LITECOINCLI) $(B1) getnewaddress $(ACCOUNT)

stop:
	$(LITECOINCLI) $(B1) stop
	$(LITECOINCLI) $(B2) stop

clean:
	find 1/regtest/* -not -name 'server.*' -delete
	find 2/regtest/* -not -name 'server.*' -delete
