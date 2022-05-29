resource "null_resource" "default" {
  count = length(var.create_commands) > 0 || length(var.destroy_commands) ? 1 : 0

  triggers = {
    create_commands = var.create_commands
    destroy_commands = var.destroy_commands
  }

  provisioner "local-exec" {
    when = create
    command = <<-EOT
        ${join("\n", self.triggers.create_commands)}
    EOT
  }

  provisioner "local-exec" {
    when = destroy
    command = <<-EOT
        ${join("\n", self.triggers.destroy_commands)}
    EOT
  }
}