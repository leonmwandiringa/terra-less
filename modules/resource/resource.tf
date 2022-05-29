resource "null_resource" "default" {
  count = length(var.commands) > 0 ? 1 : 0
  provisioner "local-exec" {
    command = <<-EOT
        ${join("\n", var.commands)}
    EOT
  }
}