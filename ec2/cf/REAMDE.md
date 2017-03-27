# Cloud Formation Notes

## Create a CloudFormation Stack via CLI

To create a stack, use the `create-stack` command along with the stack name, template and any parameters:

```bash
aws cloudformation create-stack \
  --stack-name my-stack-name \
  --template-body file://my-template.json \
  --parameters ParameterKey=KeyPair,ParameterValue=my-key-name
```

Or use the `--template-url` option instead of `--template-body` if the template file is remote:

```
--template-url https://s3-us-west-2.amazonaws.com/cf-templates-1234567789-us-west-2/20170324-td-example.template \
```

## Delete a CloudFormation Stack via CLI

To delete a cloud formation stack, use the `delete-stack` sub-command and provide the stack-name as the parameter:

```bash
aws cloudformation delete-stack \
  --stack-name my-stack-name
```

## Get Stack Status via CLI

To obtain details about the stack, use the `describe-stack-events` sub-command:

```bash
aws cloudformation describe-stack-events \
  --stack-name my-stack-name
```

## Update Stack via CLI

Updating the stack is similar to creating the stack - just use the `update-stack` sub-command.  You can only update the 
stack if it was deployed successfully.

```bash
aws cloudformation update-stack \
  --stack-name my-stack-name \
  --template-body file://my-template.json \
  --parameters ParameterKey=KeyPair,ParameterValue=my-key-name
```

## References

| Name              | Link                           |
|:------------------|:-------------------------------|
| CF Master Class   | https://www.youtube.com/watch?v=6R44BADNJA8 |
| Bootstrap Example | https://gist.github.com/kixorz/10194688 |
| CF NGINX Examples | https://gist.github.com/fabito/4048829 |
| CF Public/Private Subnets | https://edwardsamuel.wordpress.com/2015/07/04/aws-cloudformation-vpc-with-public-and-private-subnets/ |
| CF Public/Private Subnets Example | https://github.com/widdix/aws-cf-templates/blob/master/vpc/vpc-2azs.yaml |
| CF VPC Example    | https://github.com/markitx/cloud-formation-templates/blob/master/vpc.template |
| CF ELB Docs       | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-elb.html |
| CF Referencing Security Group in VPC | http://serverfault.com/questions/786705/cloud-formation-template-add-ingress-rule-to-existing-security-group |
| ELB and EIP       | https://shlomoswidler.com/2009/07/elastic-in-elastic-load-balancing-elb.html |
