<%--
  Created by IntelliJ IDEA.
  User: PCPACK
  Date: 25/05/2024
  Time: 22:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<footer id="footer" class="footer bg-overlay">
    <div class="footer-main">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-lg-4 col-md-6 footer-widget footer-about">
                    <h3 class="widget-title">About Us</h3>
                    <img loading="lazy" width="60px" class="footer-logo" src="${pageContext.request.contextPath}/img/LOGO.png" alt="Constra">

                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor inci done
                        idunt ut
                        labore et dolore magna aliqua.</p>
                    <div class="footer-social">
                        <ul>
                            <li><a href="https://facebook.com/themefisher" aria-label="Facebook"><i
                                    class="fab fa-facebook-f"></i></a></li>
                            <li><a href="https://twitter.com/themefisher" aria-label="Twitter"><i
                                    class="fab fa-twitter"></i></a>
                            </li>
                            <li><a href="https://instagram.com/themefisher" aria-label="Instagram"><i
                                    class="fab fa-instagram"></i></a></li>
                            <li><a href="https://github.com/themefisher" aria-label="Github"><i
                                    class="fab fa-github"></i></a></li>
                        </ul>
                    </div><!-- Footer social end -->
                </div><!-- Col end -->

                <div class="col-lg-4 col-md-6 footer-widget mt-5 mt-md-0">
                    <h3 class="widget-title">Working Hours</h3>
                    <div class="working-hours">
                        We work 7 days a week, every day excluding major holidays. Contact us if you have an
                        emergency, with our
                        Hotline and Contact form.
                        <br><br> Monday - Friday: <span class="text-right">10:00 - 16:00 </span>
                        <br> Saturday: <span class="text-right">12:00 - 15:00</span>
                        <br> Sunday and holidays: <span class="text-right">09:00 - 12:00</span>
                    </div>
                </div><!-- Col end -->

                <div class="col-lg-3 col-md-6 mt-5 mt-lg-0 footer-widget">
                    <h3 class="widget-title">Services</h3>
                    <ul class="list-arrow">
                        <li><a href="${pageContext.request.contextPath}/error">Pre-Construction</a></li>
                        <li><a href="${pageContext.request.contextPath}/error">General Contracting</a></li>
                        <li><a href="${pageContext.request.contextPath}/error">Construction Management</a></li>
                        <li><a href="${pageContext.request.contextPath}/error">Design and Build</a></li>
                        <li><a href="${pageContext.request.contextPath}/error">Self-Perform Construction</a></li>
                    </ul>
                </div><!-- Col end -->
            </div><!-- Row end -->
        </div><!-- Container end -->
    </div><!-- Footer main end -->

    <div class="copyright">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <div class="copyright-info">
                                <span>Copyright &copy;
                                    <script>
                                        document.write(new Date().getFullYear())
                                    </script>, Designed &amp; Developed by <a href="https://themefisher.com">Themefisher</a>
                                </span>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="footer-menu text-center text-md-right">
                        <ul class="list-unstyled">
                            <li><a href="${pageContext.request.contextPath}/error">About</a></li>
                            <li><a href="${pageContext.request.contextPath}/error">Our people</a></li>
                            <li><a href="${pageContext.request.contextPath}/error">Faq</a></li>
                            <li><a href="${pageContext.request.contextPath}/error">Blog</a></li>
                            <li><a href="${pageContext.request.contextPath}/error">Pricing</a></li>
                        </ul>
                    </div>
                </div>
            </div><!-- Row end -->

            <div id="back-to-top" data-spy="affix" data-offset-top="10" class="back-to-top position-fixed">
                <button class="btn btn-primary" title="Back to Top">
                    <i class="fa fa-angle-double-up"></i>
                </button>
            </div>

        </div><!-- Container end -->
    </div><!-- Copyright end -->
</footer><!-- Footer end -->

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>

</body>
</html>
