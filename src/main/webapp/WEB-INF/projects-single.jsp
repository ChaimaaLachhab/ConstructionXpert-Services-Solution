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
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/welcome">Home</a></li>
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/allProjects">All Projects</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Single Project</li>
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
                    <h3 class="section-sub-title">All Tasks</h3>
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
                            <a href="${pageContext.request.contextPath}/addTask?projectId=${oneProject.projectId}"><i class="ri-add-line" style="font-size: 30px; color: white;"></i></a>
                        </label>
                    </div><!-- project filter end -->

                    <section class="tasks " id="tasks">

                        <div class="tasks__container container__t grid">
                            <c:forEach var="task" items="${tasks}">
                                <article class="tasks__card">
                                    <div class="tasks__image">
                                        <img src="${task.taskImg}" alt="image" class="tasks__img" style="display: block;">

                                        <a href="${pageContext.request.contextPath}/allResources?taskId=${task.taskId}" class="tasks__button button">
                                            <i class="ri-arrow-right-up-line"></i>
                                        </a>
                                    </div>

                                    <div class="tasks__content">
                                        <h3 class="tasks__subtitle" style="font-size: 0.5rem; font-weight: 500; color: hsl(0, 0%, 35%);">Task __ ${task.status} </h3>
                                        <h2 class="tasks__title" style="font-size: 1rem;">${task.taskName}</h2>

                                        <p class="tasks__description"> ${task.description} </p>
                                    </div>
                                </article>
                            </c:forEach>
                        </div>
                    </section>
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