resource "null_resource" "create" {
  count = length(var.create_commands) > 0 ? 1 : 0

  triggers = {
    timestamp = timestamp()
  }
  
  provisioner "local-exec" {
    when = create
    command = <<-EOT
        ${join("\n", concat(var.create_commands, "echo at ${self.triggers.timestamp}, creation completed"))}
    EOT
  }

}

resource "null_resource" "destroy" {
  count = length(var.destroy_commands) > 0 ? 1 : 0

  triggers = {
    timestamp = timestamp()
  }
  
  provisioner "local-exec" {
    when = destroy
    command = <<-EOT
        ${join("\n", concat(var.destroy_commands, "echo at ${self.triggers.timestamp}, destruction completed"))}
    EOT
  }
}