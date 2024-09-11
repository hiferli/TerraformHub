resource "null_resource" "open_browser" {
  provisioner "local-exec" {
    command     = "start https://www.instagram.com/_ishaanjoshi_"
  }
}