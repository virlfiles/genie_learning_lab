# Genie Devnet Lab-3b: Execute Genie Verifications
# ================================================


*** Settings ***
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot
Library        unicon.robot.UniconRobot


*** Variables ***
# Defining variables that can be used elsewhere in the test data.
${testbed}     default_testbed.yaml


*** Test Cases ***
# Creating testcases using available Genie, pyATS & Unicon keywords


# Connect to UUT device using CLI
connect to UUT device
    use genie testbed "${testbed}"
    connect to devices "uut"


# Verification-1: Verify_BgpAllNexthopDatabase
#    1. Connect to the device and execute 'show bgp all nexthop-database'
#    2. Create Python datastructure after parsing show command output
#
execute Verify_BgpAllNexthopDatabase
    run verification "Verify_BgpAllNexthopDatabase" on device "uut"


# Verification-2: Verify_Interface
#    1. Connect to the device and execute 'show interface'
#    2. Create Python datastructure after parsing show command output
#
execute Verify_Interface
    run verification "Verify_Interface" on device "uut"


# Verification-3: Verify_BgpProcessVrfAll
#    1. Connect to the device and execute 'show bgp process vrf all'
#    2. Create Python datastructure after parsing show command output
#
execute Verify_BgpProcessVrfAll
    run verification "Verify_BgpProcessVrfAll" on device "uut"


# Verification-4: Verify_IpOspfInterface_vrf_all
#    1. Connect to the device and execute 'show ip ospf interface vrf all'
#    2. Create Python datastructure after parsing show command output
#
execute Verify_IpOspfInterface_vrf_all
    run verification "Verify_IpOspfInterface_vrf_all" on device "uut"
