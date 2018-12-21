# Genie Devnet Lab-1: Connect to a device using CLI
# =================================================


*** Settings ***
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot
Library        unicon.robot.UniconRobot


*** Variables ***
# Defining variables that can be used elsewhere in the test data.
${testbed}     /genie_tests/default_testbed.yaml


*** Test Cases ***
# Creating testcases using available Genie, PyATS & Unicon keywords


# Connect to a device using CLI as the communication protocol
connect to device with CLI
    use genie testbed "${testbed}"
    connect to devices "uut"