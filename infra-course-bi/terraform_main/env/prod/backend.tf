terraform {
  backend "s3" {
    bucket         = "bi-prod-kai-s3-terraform-state-730335335110"
    key            = "state/prod/terraform.tfstate"
    region         = "ap-northeast-1"
    profile        = "dotlife-prod"
    use_locking    = true
  }
}