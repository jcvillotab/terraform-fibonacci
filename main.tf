terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
    }
  }
}

resource "null_resource" "fibonacci" {
  provisioner "local-exec" {
    command = <<EOT
      #!/bin/bash
      a=0
      b=1
      echo -n "$a $b "
      for i in {2..21}  
      do
        fn=$((a + b))
        echo -n "$fn "
        a=$b
        b=$fn
      done
      echo "" 
    EOT
  }
}