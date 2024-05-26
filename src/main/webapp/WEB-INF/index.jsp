<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <div class="banner-carousel banner-carousel-2 mb-0">
        <div class="banner-carousel-item" style="background-image:url(${pageContext.request.contextPath}/img/bg1.jpg)">
            <div class="container">
                <div class="box-slider-content">
                    <div class="box-slider-text">
                        <h2 class="box-slide-title">17 Years Of Excellence In</h2>
                        <h3 class="box-slide-sub-title">Construction Industry</h3>
                        <p class="box-slide-description">You have ideas, goals, and dreams. We have a culturally
                            diverse, forward
                            thinking team looking for talent like.</p>
                        <p>
                            <a href="${pageContext.request.contextPath}/service" class="slider btn btn-primary">Our Service</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <section class="call-to-action no-padding">
            <div class="container">
                <div class="action-style-box">
                    <div class="row">
                        <div class="col-md-8 text-center text-md-left">
                            <div class="call-to-action-text">
                                <h3 class="action-title">We understand your needs on construction</h3>
                            </div>
                        </div><!-- Col end -->
                        <div class="col-md-4 text-center text-md-right mt-3 mt-md-0">
                            <div class="call-to-action-btn">
                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/error">Request Quote</a>
                            </div>
                        </div><!-- col end -->
                    </div><!-- row end -->
                </div><!-- Action style box -->
            </div><!-- Container end -->
        </section><!-- Action end -->

    <section id="ts-features" class="ts-features">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 mb-5">
                        <div class="ts-service-box">

                            <div class="d-flex">
                                <div class="ts-service-box-img">
                                    <img loading="lazy" src="${pageContext.request.contextPath}/img/icon-image/service-icon1.png" alt="service-icon" />
                                </div>
                                <div class="ts-service-info">
                                    <h3 class="service-box-title"><a href="${pageContext.request.contextPath}/error">Zero Harm Everyday</a>
                                    </h3>
                                    <p>You have ideas, goals, and dreams. We have a culturally diverse, forward thinking
                                        team looking for talent like. Lorem ipsum dolor suscipit.</p>
                                </div>
                            </div>
                        </div><!-- Service1 end -->
                    </div><!-- Col 1 end -->

                    <div class="col-lg-4 col-md-6 mb-5">
                        <div class="ts-service-box">

                            <div class="d-flex">
                                <div class="ts-service-box-img">
                                    <img loading="lazy" src="${pageContext.request.contextPath}/img/icon-image/service-icon2.png" alt="service-icon" />
                                </div>
                                <div class="ts-service-info">
                                    <h3 class="service-box-title"><a href="${pageContext.request.contextPath}/error">Virtual Construction</a>
                                    </h3>
                                    <p>You have ideas, goals, and dreams. We have a culturally diverse, forward thinking
                                        team looking for talent like. Lorem ipsum dolor suscipit.</p>
                                </div>
                            </div>
                        </div><!-- Service2 end -->
                    </div><!-- Col 2 end -->

                    <div class="col-lg-4 col-md-6 mb-5">
                        <div class="ts-service-box">
                            <div class="d-flex">
                                <div class="ts-service-box-img">
                                    <img loading="lazy" src="${pageContext.request.contextPath}/img/icon-image/service-icon3.png" alt="service-icon" />
                                </div>
                                <div class="ts-service-info">
                                    <h3 class="service-box-title"><a href="${pageContext.request.contextPath}/error">Build To Last</a></h3>
                                    <p>You have ideas, goals, and dreams. We have a culturally diverse, forward thinking team looking for talent like. Lorem ipsum dolor suscipit.</p>
                                </div>
                            </div>
                        </div><!-- Service3 end -->
                    </div><!-- Col 3 end -->
                </div><!-- Content row end -->
            </div><!-- Container end -->
        </section><!-- Feature are end -->

    <section id="facts" class="facts-area">
            <div class="container">
                <div class="facts-wrapper">
                    <div class="row">
                        <div class="col-md-3 col-sm-6 ts-facts">
                            <div class="ts-facts-img">
                                <img loading="lazy" src="${pageContext.request.contextPath}/img/icon-image/fact1.png" alt="facts-img">
                            </div>
                            <div class="ts-facts-content">
                                <h2 class="ts-facts-num"><span class="counterUp" data-count="1789">0</span></h2>
                                <h3 class="ts-facts-title">Total Projects</h3>
                            </div>
                        </div><!-- Col end -->

                        <div class="col-md-3 col-sm-6 ts-facts mt-5 mt-sm-0">
                            <div class="ts-facts-img">
                                <img loading="lazy" src="${pageContext.request.contextPath}/img/icon-image/fact2.png" alt="facts-img">
                            </div>
                            <div class="ts-facts-content">
                                <h2 class="ts-facts-num"><span class="counterUp" data-count="647">0</span></h2>
                                <h3 class="ts-facts-title">Staff Members</h3>
                            </div>
                        </div><!-- Col end -->

                        <div class="col-md-3 col-sm-6 ts-facts mt-5 mt-md-0">
                            <div class="ts-facts-img">
                                <img loading="lazy" src="${pageContext.request.contextPath}/img/icon-image/fact3.png" alt="facts-img">
                            </div>
                            <div class="ts-facts-content">
                                <h2 class="ts-facts-num"><span class="counterUp" data-count="4000">0</span></h2>
                                <h3 class="ts-facts-title">Hours of Work</h3>
                            </div>
                        </div><!-- Col end -->

                        <div class="col-md-3 col-sm-6 ts-facts mt-5 mt-md-0">
                            <div class="ts-facts-img">
                                <img loading="lazy" src="${pageContext.request.contextPath}/img/icon-image/fact4.png" alt="facts-img">
                            </div>
                            <div class="ts-facts-content">
                                <h2 class="ts-facts-num"><span class="counterUp" data-count="44">0</span></h2>
                                <h3 class="ts-facts-title">Countries Experience</h3>
                            </div>
                        </div><!-- Col end -->
                    </div> <!-- Facts end -->
                </div>
                <!--/ Content row end -->
            </div>
            <!--/ Container end -->
        </section><!-- Facts end -->

    <section id="project-area" class="project-area solid-bg">
            <div class="container">
                <div class="row text-center">
                    <div class="col-lg-12">
                        <h2 class="section-title">Work of Excellence</h2>
                        <h3 class="section-sub-title">Recent Projects</h3>
                    </div>
                </div>
                <!--/ Title row end -->

                <div class="row">
                    <div class="col-12">
                        <div class="shuffle-btn-group">
                            <label class="active" for="all">
                                <input type="radio" name="shuffle-filter" id="all" value="all" checked="checked">Show
                                All
                            </label>
                            <label class="active" style="border-radius: 500px; padding-left: 8px; width: 45px; height: 45px; position: absolute; right: 15px; top: 20px;">
                                <a href="${pageContext.request.contextPath}/addProject"><i class="ri-add-line" style="font-size: 30px; color: white;"></i></a>
                            </label>
                        </div><!-- project filter end -->

                        <div class="row shuffle-wrapper" style="margin-top: 30px;">

                            <c:forEach var="project" items="${projects}">
                                <div class="col-lg-4 col-md-6 shuffle-item" data-groups="[&quot;${project.projectType}&quot;]">
                                    <div class="project-img-container">
                                        <a class="gallery-popup" href="${pageContext.request.contextPath}/allTasks?projectId=${project.projectId}" aria-label="project-img">
                                            <img class="img-fluid" src="${project.projectImg}" alt="project-img">
                                            <span class="gallery-icon"><i class="fa fa-plus"></i></span>
                                        </a>
                                        <div class="project-item-info">
                                            <div class="project-item-info-content">
                                                <h3 class="project-item-title">
                                                    <a href="${pageContext.request.contextPath}/allTasks?projectId=${project.projectId}">${project.projectName}</a>
                                                </h3>
                                                <p class="project-cat">${project.projectType}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>


                        </div><!-- shuffle end -->
                    </div>

                    <div class="col-12">
                        <div class="general-btn text-center">
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/allProjects">View All Projects</a>
                        </div>

                    </div>
                </div><!-- Content row end -->
            </div>
            <!--/ Container end -->
        </section><!-- Project area end -->

    <%@include file="footer.jsp"%>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
            crossorigin="anonymous"></script>
</body>
</html>