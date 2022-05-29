resource "null_resource" "default" {
  count = length(var.create_commands) > 0 || length(var.destroy_commands) ? 1 : 0
  triggers = {
    timestamp = var.tags.Timestamp
  }
  provisioner "local-exec" {
    when = create
    command = <<-EOT
        ${join("\n", var.create_commands)}
    EOT
  }

  provisioner "local-exec" {
    when = destroy
    command = <<-EOT
        ${join("\n", var.destroy_commands)}
    EOT
  }
}