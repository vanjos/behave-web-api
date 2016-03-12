#!/bin/bash
(python -m nose test) &&
(nohup python testserver.py & echo $! > run.pid && sleep 3) &&
BASE_URL=localhost:5000 behave features/requests.feature &&
kill `cat run.pid`
