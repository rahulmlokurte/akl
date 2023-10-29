# Rain - A development workflow tool for working with AWS CloudFormation

## commands

1. To list running CloudFormation stacks

```shell
rain ls <stack_name> -r us-west-2
```

2.To get the CloudFormation template from a running stack

```shell
rain cat <stack> -r us-west-2
```

> stack_name is optional, if we do not provide, then it will display all running stacks. profile_name is also optional. **all** will display a list stacks in all regions; if you specify a stack, show more details

3.To display an updating view of a CloudFormation stack. It repeatedly displays the status of a CloudFormation stack. Useful for watching the progress of a deployment.

```shell
rain watch <stack> -r us-west-2
```

> Optional **-w, --wait** - wait for changes to begin rather than refusing to watch an unchanging stack

credits: https://github.com/aws-cloudformation/rain
