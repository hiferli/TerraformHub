resource "null_resource" "GetAppFromWebAndStartTheSame" {
  provisioner "local-exec" {
    command = "git clone https://github.com/w3cj/express-api-starter.git"
    working_dir = "C:\\Terraform"
    interpreter = ["cmd.exe", "/c"]
    on_failure = continue
  }

  provisioner "local-exec" {
    command = "npm install"
    working_dir = "C:\\Terraform\\express-api-starter"
    interpreter = ["cmd.exe", "/c"]
    on_failure = continue
  }

  provisioner "local-exec" {
    command = "npm start"
    working_dir = "C:\\Terraform\\express-api-starter"
    interpreter = ["cmd.exe", "/c"]
    on_failure = continue
  }

  provisioner "local-exec" {
    command = "python Script.py"
    on_failure = fail
  }
}