resource "null_resource" "sample" {
  provisioner "local-exec" {
    command = "echo Hello World"
  }
}

resource "null_resource" "kubeconfig" {
  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --name dev-neo-eks  --region ap-south-1"
  }
}

resource "null_resource" "kubectl" {
  depends_on = [null_resource.kubeconfig]
  provisioner "local-exec" {
    command = "kubectl get pods --all-namespaces"
  }
}

terraform {
  backend "s3" {
    encrypt                 = true
    dynamodb_table          = "terraform-locks"
    region                  = "ap-south-1"
  }
}