resource "null_resource" "example" {
  provisioner "local-exec" {
    command     = "echo Environment: %MY_VAR% > example.txt"
    environment = {
      MY_VAR = "Production"
    }
    working_dir = "C:\\Terraform"
    interpreter = ["cmd.exe", "/c"]
    on_failure  = continue
  }
}