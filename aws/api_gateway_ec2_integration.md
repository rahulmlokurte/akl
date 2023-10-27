# API Gateway With EC2 Integration

Create a private API Gateway integration with the EC2 instance behind the network load balancer

## Create a security group

- Provide the security group name
- Inbound Rules: Open a single 8080 port for the load balancer. Give the following details.
  - Type: Custom TCP
  - Protocol: TCP
  - Port range: 8080
  - Source: \<VPC CIDR> (AWS will perform health check for your applications)
  - Description: \<description>
- Click on create a security group

> 1. For debugging, if you need to ssh to the EC2 instance, we can use **AWS Session Manager**. This is used to ssh and install an application(Ex: SpringBoot, Express)
>
>
>
> 2. To get the **VPC CIDR**, we can go to VPC service and get the IPV4 CIDR values.

## Create an EC2 Instance

- Provide the name and specify the OS and the instance Type
- In Network Settings, select the private Subnets
- Select the security group
- Click on Launch Instance

## Create a Target Group

Target group is used by the load balancer to provide the healthy instances to distribute the traffic.

- Target Type: Instances
- Provide the Target group name
- Protocol: TCP Port: 8080 (As we use network load balancer that works on layer 4 of the OSI model, we need to put it as TCP)
- Select the VPC
- Health Check protocol: TCP (We can also select HTTP, if we have health check implemented in the application. We also need to provide the health path e.g. /health)
- Register the EC2 instance with this target group. It will be in pending state untill we create a load balancer and associate it with this target group.

## Create a Load Balancer

Since API gateway functions on layer 7 and can understand the application request, we can create a **Network Load Balancer**.

- provide loadbalancer name
- Scheme: Internal (As we will use private integration, we dont need to expose to the internet. It will create a network load balancer in private subnets and it can only be accessed within VPC)
- IP address Type: IPV4
- Select VPC and private subnets
- Listener Protocol: TCP and port: 8080
- Select the target group which was created earlier
- Click on create network loadbalancer
- Wait for network loadbalancer to become active

