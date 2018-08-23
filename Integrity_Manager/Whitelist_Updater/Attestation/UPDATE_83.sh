#!/usr/bin/env bash
echo "TUX UPDATE KERNEL VERSION 4.4.0-83"
dbname="mw_as"
#currently we update whitelist valuse with perfixed known good values for simplicity.
#But it can be calculated with TPM_CALCULATOR 
psql $dbname << EOF
SELECT name, value, pcr_bank from mw_pcr_manifest where pcr_bank='SHA256' ORDER BY cast(name as int);
UPDATE mw_pcr_manifest set value='f3d5c2b74d026d220c73d1bce24fc622273c132010548301c3992292be429691' where name='12' and pcr_bank='SHA256';
EOF
