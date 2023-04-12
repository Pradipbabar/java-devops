# Create an ECS cluster

resource "aws_ecs_cluster" "my_cluster" {
  name = "java-devops"
}

# Create a task definition

resource "aws_ecs_task_definition" "my_task_definition" {
  family                   = "my-task"
  container_definitions    = jsonencode([
    {
      name              = "docker"
      image             = "pradipbabar/coupon-app:latest"
      cpu               = 0
      portMappings      = [
        {
          name          = "docker-8090-tcp"
          containerPort = 8090
          hostPort      = 8090
          protocol      = "tcp"
          appProtocol   = "http"
        }
      ]
      essential         = true
      environment       = []
      environmentFiles  = []
      mountPoints       = []
      volumesFrom       = []
    }
  ])
  network_mode             = "awsvpc"
  execution_role_arn       = "arn:aws:iam::451431656082:role/ecsTaskExecutionRole"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "1024"
  memory                   = "3072"
  tags = {
    coupon = "image"
  }
}


# Create a service that runs tasks in the cluster

resource "aws_ecs_service" "my_service" {
  name = "my-service"
  cluster = aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.my_task_definition.arn
  desired_count = 1
  launch_type = "FARGATE"
  network_configuration {
    subnets = [data.aws_subnet.infra_subnet_1.id]
    security_groups = [data.aws_security_group.default.id]
    assign_public_ip = true

  }

}

