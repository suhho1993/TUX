#!/usr/bin/env bash
echo "TUX UPDATE TO KERNEL VER 4.4.0-62"
dbname="mw_as"
#currently we update whitelist valuse with perfixed known good values for simplicity.
#But it can be calculated with TPM_CALCULATOR 
psql $dbname << EOF
UPDATE mw_pcr_manifest set value='DE0160A875FB2A3CBE4AA5F163561A4DD188478C09972FF1CB755EBB8A27806A' where name='12' and pcr_bank='SHA256';
SELECT name, value, pcr_bank from mw_pcr_manifest where pcr_bank='SHA256' ORDER BY cast(name as int);
EOF
