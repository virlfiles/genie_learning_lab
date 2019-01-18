# Genie Devnet Lab-4: Running Genie PTS
# =====================================


*** Settings ***
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot
Library        unicon.robot.UniconRobot


*** Variables ***
# Defining variables that can be used elsewhere in the test data.
${testbed}     default_testbed.yaml


*** Test Cases ***
# Creating testcases using available Genie, pyATS & Unicon keywords


# Connect to UUT and helper device using CLI
connect to UUT and helper device
    use genie testbed "${testbed}"
    connect to devices "uut ; helper"


# Run PTS for features BGP and OSPF on all devices
# Save it to local variable "pre_trigger_snapshot"
profile bgp & ospf on all devices as pre-trigger-snapshot
    Profile the system for "bgp;ospf" on devices "uut;helper" as "pre_trigger_snapshot"


# Execute a trigger on UUT
execute TriggerShutNoShutBgp on uut
    run trigger "TriggerShutNoShutBgp" on device "uut"


# Run PTS for features BGP and OSPF on all devices
# Save it to local variable "post_trigger_snapshot"
profile bgp & ospf on all devices as post-trigger-snapshot
    Profile the system for "bgp;ospf" on devices "uut;helper" as "post_trigger_snapshot"


# Compare pre_trigger_snapshot with pre_trigger_snapshot
compare pre_trigger_snapshot to pre-trigger-snapshot
    Compare profile "post_trigger_snapshot" with "pre_trigger_snapshot" on devices "uut;helper"
