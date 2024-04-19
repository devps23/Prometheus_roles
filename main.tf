module "demo" {
  source = "./modules/app"
  ami= var.ami
  instance_type = var.instanceType
  tools_name = var.tagname
}