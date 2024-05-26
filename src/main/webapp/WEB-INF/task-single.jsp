
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

    <div id="banner-area" class="banner-area" style="background-image:url(${pageContext.request.contextPath}/img/banner/banner1.jpg)">
        <div class="banner-text">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="banner-heading">
                            <h1 class="banner-title">Task</h1>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb justify-content-center">
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/welcome">Home</a></li>
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/allProjects">All Projects</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Single Task</li>
                                </ol>
                            </nav>
                        </div>
                    </div><!-- Col end -->
                </div><!-- Row end -->
            </div><!-- Container end -->
        </div><!-- Banner text end -->
    </div><!-- Banner area end -->

    <section id="project-area" class="project-area">
        <div class="container">
            <div class="row text-center">
                <div class="col-lg-12">
                    <h2 class="section-title">Work of Excellence</h2>
                    <h3 class="section-sub-title">All Resources</h3>
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
                            <a href="${pageContext.request.contextPath}/addResource?taskId=${oneTask.taskId}"><i class="ri-add-line" style="font-size: 30px; color: white;"></i></a>
                        </label>
                    </div><!-- project filter end -->

                    <div class="page-wrapper-r">
                        <div class="container-r">
                            <ul class="infographic-cards">
                                <c:forEach var="resource" items="${resources}">

                                    <c:if test="${resource.type == 'MATERIALS'}">
                                        <li class="color-1">
                                            <img width="100px" class="footer-logo"
                                                 src="${resource.resourceImg}"
                                                 alt="Constra">
                                            <h5>${resource.resourceName}</h5>
                                            <h6>${resource.quantity}&nbsp${resource.type}</h6>
                                            <h6 style="margin-bottom: 35px;">${resource.supplierInformation}</h6>

                                            <div class="number-box">
                                                <i class="ri-lightbulb-line" style="color: white"></i>
                                            </div>
                                        </li>
                                    </c:if>
                                    <c:if test="${resource.type == 'SOFTWARE'}">
                                        <li class="color-2">
                                            <img width="100px" class="footer-logo"
                                                 src="${resource.resourceImg}"
                                                 alt="Constra">
                                            <h5>${resource.resourceName}</h5>
                                            <h6>${resource.quantity}&nbsp${resource.type}</h6>
                                            <h6 style="margin-bottom: 35px;">${resource.supplierInformation}</h6>

                                            <div class="number-box">
                                                <i class="ri-wifi-line" style="color: white"></i>
                                            </div>
                                        </li>
                                    </c:if>

                                    <c:if test="${resource.type == 'PERSONNEL'}">
                                        <li class="color-3">
                                            <img width="100px" class="footer-logo"
                                                 src="https://wallpapers.com/images/hd/generic-male-avatar-icon-piiktqtfffyzulft.jpg"
                                                 alt="Constra">
                                            <h5>${resource.resourceName}</h5>
                                            <h6>${resource.quantity}&nbsp${resource.type}</h6>
                                            <h6 style="margin-bottom: 35px;">${resource.supplierInformation}</h6>


                                            <div class="number-box">
                                                <i class="ri-user-fill" style="color: white"></i>
                                            </div>
                                        </li>
                                    </c:if>

                                    <c:if test="${resource.type == 'EQUIPMENT'}">
                                        <li class="color-4">
                                            <img width="100px" class="footer-logo"
                                                 src="${resource.resourceImg}"
                                                 alt="Constra">
                                            <h5>${resource.resourceName}</h5>
                                            <h6>${resource.quantity}&nbsp${resource.type}</h6>
                                            <h6 style="margin-bottom: 35px;">${resource.supplierInformation}</h6>


                                            <div class="number-box">
                                                <i class="ri-codepen-line" style="color: white"></i>
                                            </div>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col-12">
                    <div class="general-btn text-center">
                        <a class="btn btn-primary" href="${pageContext.request.contextPath}/welcome">Back to Home Page</a>
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

