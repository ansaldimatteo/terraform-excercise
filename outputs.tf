output "web_lb_dns_name" {
  description = "The DNS name of the web load balancer"
  value       = aws_lb.web-external-alb.dns_name
}

output "application_lb_dns_name" {
  description = "The DNS name of the application load balancer"
  value       = aws_lb.application-external-alb.dns_name
}