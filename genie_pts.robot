# Genie Devnet Lab-5: Running Genie PTS
# =====================================


*** Settings ***
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot
Library        unicon.robot.UniconRobot


*** Variables ***
# Defining variables that can be used elsewhere in the test data.
${testbed}     /genie_tests/default_testbed.yaml


*** TestCases ***
# Creating testcases using available Genie, PyATS & Unicon keywords


# Connect to UUT device using CLI
connect to UUT device
    use genie testbed "${testbed}"
    connect to devices "uut"


# Run PTS on all devices and save it to local variable pre_trigger_snapshot
profile bgp & ospf on All as pre trigger snapshot and compare to golden PTS
    Profile the system for "bgp;ospf" on devices "nx-osv-1;csr1000v-1" at "pre_trigger_snapshot"


# Execute some action that could impact device operational state
execute TriggerShutNoShutBgp
    run trigger "TriggerShutNoShutBgp" on device "uut"


# Run PTS on all devices, save it to local variable post_trigger_snapshot and compare it with pre_trigger_snapshot
profile bgp & ospf on All as post trigger snapshot and compare to pre trigger snapshot
    Profile the system for "bgp;ospf" on devices "nx-osv-1;csr1000v-1" at "post_trigger_snapshot"
    Compare profile "post_trigger_snapshot" with "pre_trigger_snapshot" on devices "nx-osv-1;csr1000v-1"
