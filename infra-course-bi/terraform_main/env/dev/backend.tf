terraform {
  backend "s3" {
    bucket         = "bi-dev-kai-s3-terraform-state-637423323564"
    key            = "state/dev/terraform.tfstate"
    region         = "ap-northeast-1"
    profile        = "dotlife-dev"
    use_locking    = true
  }
}