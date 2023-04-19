variable "S3Bucket" {
    type = string
    default = "votingapp.vmware.education"
}

variable "S3Bucket_Domain_Name" {
    type = string
    default = "votingapp.vmware.education.s3.amazonaws.com"
}

variable "S3Bucket_id"{
    type = string
    default = "votingapp.vmware.education"
}

variable "acm_cert_arn" {
    type = string
    default = "arn:aws:acm:us-east-1:994172548385:certificate/21767233-86a6-4863-8900-8a1772ef4d91"
}