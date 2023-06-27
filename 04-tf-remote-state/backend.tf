terraform {
    backend "s3" {
        bucket  = "b50-tf-state-bucket-konda"
        key     = "demo/env/terrafom.tfstate"
        region  = "us-east-1"
     
    }
    
}