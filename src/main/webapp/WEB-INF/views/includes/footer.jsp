<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#wrapper {
  height: 50px;
}

footer {
  height: 200px;
  position: relative;

  margin: 0;
  padding: 0;
  background: #262626;
}

.footer_brand ul {
  margin: 0;
  padding: 0;
  display: flex;
  position: absolute;
  top: 30%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.footer_brand ul li {
  /*간격*/
  list-style: none;
  margin: 0 15px;
}

.footer_brand ul li a {
  position: relative;
  display: block;
  width: 50px;
  height: 50px;
  text-align: center;
  background: #333;
  border-radius: 50%;
  font-size: 25px;
  color: #666;
  transition: 0.5s;
}
.footer_brand ul li i{
  line-height: 50px;
}
.footer_brand ul li a::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  border-radius: 50%;
  background: #ffee10;
  transition: 0.5s;
  transform: scale(0.9);
  z-index: -1;
}

.footer_brand ul li a:hover::before {
  transform: scale(1.1);
  box-shadow: 0 0 15px #ffee10;
}
.footer_brand ul li a:hover {
  color: #ffee10;
  box-shadow: 0 0 5px #ffee10;
  text-shadow: 0 0 5px #ffee10;
}

.footer_text p {
  text-align: center;
  font-weight: 500;
  color: rgb(119, 119, 119);
  transform: translate(-50%, -50%);
  position: absolute;
  top: 60%;
  left: 50%;
}

</style>
<body>
<div id="wrapper"></div>
    <footer>
      <div class="footer_brand">
        <ul>
          <li>
            <a href="#">
              <i class="xi-instagram"></i>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="xi-youtube-play"></i>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="xi-facebook-official"></i>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="xi-twitter"></i>
            </a>
          </li>
        </ul>
      </div>
      <div class="footer_text">
        <p>
          <span> HealthCare</span><br />
          <span> Email : healthcareeeee@gmail.com</span><br />
        </p>
      </div>
    </footer>
</body>
</html>