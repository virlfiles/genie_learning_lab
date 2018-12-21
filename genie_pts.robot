# Genie Devnet Lab-4: Running Genie PTS
# =====================================


*** Settings ***
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot
Library        unicon.robot.UniconRobot


*** Variables ***
# Defining variables that can be used elsewhere in the test data.
${testbed}     /genie_tests/default_testbed.yaml


*** Test Cases ***
# Creating testcases using available Genie, PyATS & Unicon keywords


# Connect to UUT and helper device using CLI
connect to UUT and helper device
    use genie testbed "${testbed}"
    connect to devices "uut"
    connect to devices "helper"


# Run PTS for features BGP and OSPF on all devices
# Save it to local variable "pre_trigger_snapshot"
#
profile bgp & ospf on all devices as pre-trigger-snapshot
    Profile the system for "bgp;ospf" on devices "uut;helper" as "pre_trigger_snapshot"


# Execute some action that could impact device operational state
execute TriggerShutNoShutBgp
    run trigger "TriggerShutNoShutBgp" on device "uut"


# Run PTS for features BGP and OSPF on all devices
# Save it to local variable "post_trigger_snapshot"
# Compare it with pre_trigger_snapshot
#
profile bgp & ospf on all devices as post-trigger-snapshot and compare to pre-trigger-snapshot
    Profile the system for "bgp;ospf" on devices "uut;helper" as "post_trigger_snapshot"
    Compare profile "post_trigger_snapshot" with "pre_trigger_snapshot" on devices "uut;helper"