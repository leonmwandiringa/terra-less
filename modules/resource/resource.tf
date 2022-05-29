resource "null_resource" "default" {
  count = length(var.create_commands) > 0 || length(var.destroy_commands) > 0 ? 1 : 0

  triggers = {
    timestamp = timestamp()
    create_commands = join("\n", var.create_commands)
    destroy_commands = join("\n", var.destroy_commands)
  }
  
  provisioner "local-exec" {
    when = create
    command = <<-EOT
        ${self.triggers.create_commands}
    EOT
  }

  provisioner "local-exec" {
    when = destroy
    command = <<-EOT
        ${self.triggers.create_commands}
    EOT
  }
}
