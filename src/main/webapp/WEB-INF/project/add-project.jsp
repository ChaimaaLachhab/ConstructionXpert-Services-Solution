
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

<%@include file="../header.jsp"%>

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

        <form id="projectForm" enctype="multipart/form-data">
            <section class="container flex-column col-md-6 col-sm-11 mt-5" style="background-color: rgba(133, 132, 132, 0.2); width: 55%; padding: 30px; border-radius: 20px; box-shadow: 5px 5px 20px rgb(0, 0, 0, 0.5);">
                <div>
                    <h4>Project Name:</h4>
                    <input class="form-control mb-4" type="text" placeholder="Enter Name" id="projectName" name="projectName">
                </div>
                <div class="mb-4">
                    <h4>Type:</h4>
                    <select class="form-select" id="projectType" name="projectType">
                        <option value="COMMERCIAL">COMMERCIAL</option>
                        <option value="EDUCATION">EDUCATION</option>
                        <option value="GOVERNMENT">GOVERNMENT</option>
                        <option value="INFRASTRUCTURE">INFRASTRUCTURE</option>
                        <option value="RESIDENTIAL">RESIDENTIAL</option>
                        <option value="HEALTHCARE">HEALTHCARE</option>
                    </select>
                </div>
                <div class="mb-4">
                    <h4>Project Image:</h4>
                    <input class="form-control mb-4" type="text" placeholder="Enter Name" id="projectImg" name="projectImg">
                </div>
                <div class="mb-4">
                    <h4>Description:</h4>
                    <div class="form-floating">
                        <textarea class="form-control" placeholder="Leave a comment here" id="description" name="description" style="height: 100px"></textarea>
                    </div>
                </div>
                <div class="mb-4">
                    <h4>Start Date:</h4>
                    <input type="date" class="form-control" id="startDate" name="startDate">
                </div>
                <div class="mb-4">
                    <h4>End Date:</h4>
                    <input type="date" class="form-control" id="endDate" name="endDate">
                </div>
                <div class="mb-4">
                    <h4>Budget:</h4>
                    <input type="number" class="form-control" id="budget" name="budget" step="0.01" placeholder="Enter Budget">
                </div>
                <button type="submit" class="btn globalBgColor ms-3">Submit</button>
            </section>
        </form>

        <script>
            async function sendData(event) {
                event.preventDefault();

                const confirmation = confirm('Are you sure you want to submit this project?');
                if (!confirmation) {
                    return;
                }

                var projectName = document.getElementById("projectName").value;
                var projectType = document.getElementById("projectType").value;
                var projectImg = document.getElementById("projectImg").value;
                var description = document.getElementById("description").value;
                var startDate = document.getElementById("startDate").value;
                var endDate = document.getElementById("endDate").value;
                var budget = document.getElementById("budget").value;

                const data = {
                    projectName: projectName,
                    projectType: projectType,
                    projectImg: projectImg,
                    description: description,
                    startDate: startDate,
                    endDate: endDate,
                    budget: budget
                };

                try {
                    const response = await fetch(`${pageContext.request.contextPath}/AddProjectServlet`, {
                        method: 'POST',
                        headers: {
                            'Accept': 'application/json',
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(data)
                    });

                    if (response.redirected) {
                        window.location.href = response.url;
                    } else {
                        const result = await response.json();
                        console.log(result);
                    }
                } catch (error) {
                    console.error('Error:', error);
                }
            }

            document.getElementById('projectForm').addEventListener('submit', sendData);

        </script>


    </div>
    <!--/ Container end -->
</section><!-- Project area end -->

<%@include file="../footer.jsp"%>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>

</html>

