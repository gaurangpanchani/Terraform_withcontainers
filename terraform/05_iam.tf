resource "aws_iam_role" "ecs-host-role" {
  name               = "ecs_host_role_prod"
  assume_role_policy = file("D:/training/Pravin_Singampalli/prime4.0/praveensingam1994dec-repo/Terraform_withcontainers/terraform/policies/ecs-role.json")
}

resource "aws_iam_role_policy" "ecs-instance-role-policy" {
  name   = "ecs_instance_role_policy"
  policy = file("D:/training/Pravin_Singampalli/prime4.0/praveensingam1994dec-repo/Terraform_withcontainers/terraform/policies/ecs-instance-role-policy.json")
  role   = aws_iam_role.ecs-host-role.id
}

resource "aws_iam_role" "ecs-service-role" {
  name               = "ecs_service_role_prod"
  assume_role_policy = file("D:/training/Pravin_Singampalli/prime4.0/praveensingam1994dec-repo/Terraform_withcontainers/terraform/policies/ecs-role.json")
}

resource "aws_iam_role_policy" "ecs-service-role-policy" {
  name   = "ecs_service_role_policy"
  policy = file("D:/training/Pravin_Singampalli/prime4.0/praveensingam1994dec-repo/Terraform_withcontainers/terraform/policies/ecs-service-role-policy.json")
  role   = aws_iam_role.ecs-service-role.id
}

resource "aws_iam_instance_profile" "ecs" {
  name = "ecs_instance_profile_prod"
  path = "/"
  role = aws_iam_role.ecs-host-role.name
}
