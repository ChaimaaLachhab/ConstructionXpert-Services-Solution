<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.2.0/fonts/remixicon.css" rel="stylesheet" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>
<%@include file="header.jsp"%>

    <div id="banner-area" class="banner-area" style="background-image:url(${pageContext.request.contextPath}/img/banner/banner1.jpg)">
        <div class="banner-text">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="banner-heading">
                            <h1 class="banner-title">Services</h1>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb justify-content-center">
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/welcome">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Services</li>
                                </ol>
                            </nav>
                        </div>
                    </div><!-- Col end -->
                </div><!-- Row end -->
            </div><!-- Container end -->
        </div><!-- Banner text end -->
    </div><!-- Banner area end -->

    <section id="ts-service-area" class="ts-service-area pb-0 pt-5">
        <div class="container">
            <div class="row text-center">
                <div class="col-12">
                    <h2 class="section-title">We Are Specialists In</h2>
                    <h3 class="section-sub-title">What We Do</h3>
                </div>
            </div>
            <!--/ Title row end -->

            <div class="row">
                <div class="col-lg-4">
                    <div class="ts-service-box d-flex">
                        <div class="ts-service-box-img">
                            <img loading="lazy" src="${pageContext.request.contextPath}/img/icon-image/service-icon1.png" alt="service-icon">
                        </div>
                        <div class="ts-service-box-info">
                            <h3 class="service-box-title"><a href="#">Home Construction</a></h3>
                            <p>Lorem ipsum dolor sit amet consectetur adipiscing elit Integer adipiscing erat</p>
                        </div>
                    </div><!-- Service 1 end -->

                    <div class="ts-service-box d-flex">
                        <div class="ts-service-box-img">
                            <img loading="lazy" src="${pageContext.request.contextPath}/img/icon-image/service-icon2.png" alt="service-icon">
                        </div>
                        <div class="ts-service-box-info">
                            <h3 class="service-box-title"><a href="#">Building Remodels</a></h3>
                            <p>Lorem ipsum dolor sit amet consectetur adipiscing elit Integer adipiscing erat</p>
                        </div>
                    </div><!-- Service 2 end -->

                    <div class="ts-service-box d-flex">
                        <div class="ts-service-box-img">
                            <img loading="lazy" src="${pageContext.request.contextPath}/img/icon-image/service-icon3.png" alt="service-icon">
                        </div>
                        <div class="ts-service-box-info">
                            <h3 class="service-box-title"><a href="#">Interior Design</a></h3>
                            <p>Lorem ipsum dolor sit amet consectetur adipiscing elit Integer adipiscing erat</p>
                        </div>
                    </div><!-- Service 3 end -->

                </div><!-- Col end -->

                <div class="col-lg-4 text-center">
                    <img loading="lazy" class="img-fluid" src="${pageContext.request.contextPath}/img/services/service-center.jpg"
                        alt="service-avater-image">
                </div><!-- Col end -->

                <div class="col-lg-4 mt-5 mt-lg-0 mb-4 mb-lg-0">
                    <div class="ts-service-box d-flex">
                        <div class="ts-service-box-img">
                            <img loading="lazy" src="${pageContext.request.contextPath}/img/icon-image/service-icon4.png" alt="service-icon">
                        </div>
                        <div class="ts-service-box-info">
                            <h3 class="service-box-title"><a href="#">Exterior Design</a></h3>
                            <p>Lorem ipsum dolor sit amet consectetur adipiscing elit Integer adipiscing erat</p>
                        </div>
                    </div><!-- Service 4 end -->

                    <div class="ts-service-box d-flex">
                        <div class="ts-service-box-img">
                            <img loading="lazy" src="${pageContext.request.contextPath}/img/icon-image/service-icon5.png" alt="service-icon">
                        </div>
                        <div class="ts-service-box-info">
                            <h3 class="service-box-title"><a href="#">Renovation</a></h3>
                            <p>Lorem ipsum dolor sit amet consectetur adipiscing elit Integer adipiscing erat</p>
                        </div>
                    </div><!-- Service 5 end -->

                    <div class="ts-service-box d-flex">
                        <div class="ts-service-box-img">
                            <img loading="lazy" src="${pageContext.request.contextPath}/img/icon-image/service-icon6.png" alt="service-icon">
                        </div>
                        <div class="ts-service-box-info">
                            <h3 class="service-box-title"><a href="#">Safety Management</a></h3>
                            <p>Lorem ipsum dolor sit amet consectetur adipiscing elit Integer adipiscing erat</p>
                        </div>
                    </div><!-- Service 6 end -->
                </div><!-- Col end -->
            </div><!-- Content row end -->

        </div>
        <!--/ Container end -->
    </section><!-- Service end -->

<%@include file="footer.jsp"%>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
</body>

</html>