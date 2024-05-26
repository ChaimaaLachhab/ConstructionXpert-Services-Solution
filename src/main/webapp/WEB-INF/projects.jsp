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
                            <h1 class="banner-title">Project</h1>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb justify-content-center">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item"><a href="#">Project</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">All Projects</li>
                                </ol>
                            </nav>
                        </div>
                    </div><!-- Col end -->
                </div><!-- Row end -->
            </div><!-- Container end -->
        </div><!-- Banner text end -->
    </div><!-- Banner area end -->

<section id="project-area" class="project-area solid-bg">
    <div class="container">
        <div class="row text-center">
            <div class="col-lg-12">
                <h2 class="section-title">Work of Excellence</h2>
                <h3 class="section-sub-title">All Projects</h3>
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
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/welcome">Go back Home</a>
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