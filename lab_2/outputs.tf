output "public_ip" {
  value = aws_instance.example.public_ip
}

output "ssh_rsa_pub_key" { value = tls_private_key.mykey.public_key_openssh }
# NOTE: we mark this element as sensitive information,
# to be able to output the value
output "ssh_pem_key" {
  value     = tls_private_key.mykey.private_key_pem
  sensitive = true
}

output "private_ip" {
  value = aws_instance.example.private_ip
}
output "public_dns" {
  value = aws_instance.example.public_dns
}

