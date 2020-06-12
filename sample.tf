resource "null_resource" "sample" {
  provisioner "local-exec" {
    command = "echo Hello World"
  }
}


terraform {
  backend "s3" {
    encrypt                 = true
    dynamodb_table          = "terraform-locks"
    region                  = "ap-south-1"
  }
}