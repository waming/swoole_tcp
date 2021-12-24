# swoole_tcp
swoole tcp server

# Introduction
  A tcp Server base [swoole](https://github.com/swoole/swoole) 

# install
  Only docker is supported
  
  step:1
  
  install composer [composer](https://github.com/composer/composer) 
  
  ```base
  composer install
  ```
  
  step:2
  
  ```base
  docker build tagname .
  docker run --name=test_tcp -d -p 5401:9501 -v /root:/opt/www --restart=always tagname
  ```
  
  step:3
  
  Check tcp server
  ```base
  docker exec -it test_tcp /bin/bash
  php test.php
  ```

# License

  
