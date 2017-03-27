# TD Homework Project 

This project contains an Amazon Web Service CloudFormation template and support scripts to provision and deploy
a set of web servers behind an Elastic Load Balancer.  The deployment leverages Amazon's Virtual Private Cloud.

To access the infrastructure, you must first log into the DevOps workstation which is included with the provisioning.

The below diagram illustrates the deployment.

![AWS Architecture](images/td-homework.png)

The create and manage the CloudFormation stack, a set of helper scripts (examples) are provided for command line use.
 
| Script Name | Purpose |
|:------------|:--------|
| `create-stack.sh` | Creates the CloudFormation stack in AWS |
| `delete-stack.sh` | Deletes the CloudFormation stack in AWS |
| `get-stack-status.sh` | Provides some diagnostic output and status information about a given CloudFormation stack in AWS |
| `list-stacks.sh` | Returns a list of CloudFormation stacks under your account in AWS |

# Prerequisites

- Must have an account in AWS with AWS Access Key and AWS Secret Access Key
- Must have the [AWS command line tools](https://aws.amazon.com/cli/) installed and configured (`~/.aws/config` and `~/.aws/credentials`)
- Must have a SSH key created or registered with AWS

# Notes

This CloudFormation template is designed to deploy in the US West 2 region.  The web servers and NAT router are not accessible
via SSH port 22 unless you first jump to the DevOps box.
