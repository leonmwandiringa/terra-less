resource "null_resource" "default" {
  count = length(var.create_commands) > 0 || length(var.destroy_commands) > 0 ? 1 : 0

  triggers = {
    timestamp = var.tags.Timestamp
  }
  
  provisioner "local-exec" {
    when = create
    command = <<-EOT
        ${join("\n", concat(var.create_commands, "echo at ${self.triggers.timestamp}, creation completed"))}
    EOT
  }

  provisioner "local-exec" {
    when = destroy
    command = <<-EOT
        ${join("\n", concat(var.destroy_commands, "echo ${self.triggers.timestamp}, destruction completed"))}
    EOT
  }
}