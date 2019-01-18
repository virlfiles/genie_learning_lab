# Genie Devnet Lab-1: Connect to a device using CLI
# =================================================


*** Settings ***
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot
Library        unicon.robot.UniconRobot


*** Variables ***
# Defining variables that can be used elsewhere in the test data.
${testbed}     default_testbed.yaml


*** Test Cases ***
# Creating testcases using available Genie, pyATS & Unicon keywords


# Connect to a device using CLI as the communication protocol
connect to device with CLI
    use genie testbed "${testbed}"
    connect to devices "uut"