resource "null_resource" "run_script" {
  provisioner "local-exec" {
    command = "python Script.py"
  }

  provisioner "local-exec" {
    command = "echo 'Opened Instagram Successfully!'"
  }
}
