 task hello {
  input {
    File infile
    String pattern
  }
  command <<<
    egrep '~{pattern}' '~{infile}'
  >>>
  runtime {
    container: "my_image:latest"
  }
  output {
    Array[String] matches = read_lines(stdout())
  }
  }
  workflow wf {
  input {
    File infile
    String pattern
  }
  call hello {
    input: infile, pattern
  }
  output {
    Array[String] matches = hello.matches
  }
  }
