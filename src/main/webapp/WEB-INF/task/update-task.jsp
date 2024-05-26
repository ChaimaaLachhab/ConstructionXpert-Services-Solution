
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

        <form id="taskForm" enctype="multipart/form-data">
            <section class="container flex-column col-md-6 col-sm-11 mt-5" style="background-color: rgba(133, 132, 132, 0.2); width: 55%; padding: 30px; border-radius: 20px; box-shadow: 5px 5px 20px rgb(0, 0, 0, 0.5);">
                <input type="text" id="projectId" name="projectId" value="${projectId}">
                <input type="text" id="taskId" name="taskId" value="${task.taskId}">
                <div>
                    <h4>Task Name:</h4>
                    <input class="form-control mb-4" type="text" placeholder="Enter Name" id="taskName" name="taskName" value="${task.taskName}">
                </div>
                <div class="mb-4">
                    <h4>Status:</h4>
                    <select class="form-select" id="taskStatus" name="taskStatus">
                        <option value="NOT_STARTED" ${task.status == 'NOT_STARTED' ? 'selected' : ''}>Not Started</option>
                        <option value="IN_PROGRESS" ${task.status == 'IN_PROGRESS' ? 'selected' : ''}>In Progress</option>
                        <option value="COMPLETED" ${task.status == 'COMPLETED' ? 'selected' : ''}>Completed</option>
                    </select>
                </div>

                <div class="mb-4">
                    <h4>Task Image:</h4>
                    <input class="form-control mb-4" type="text" placeholder="Enter Name" id="taskImg" name="taskImg" value="${task.taskImg}">
                </div>
                <div class="mb-4">
                    <h4>Description:</h4>
                    <div class="form-floating">
                        <textarea class="form-control" placeholder="Leave a comment here" id="taskDescription" name="taskDescription" style="height: 100px">${task.description}</textarea>
                    </div>
                </div>
                <div class="mb-4">
                    <h4>Start Date:</h4>
                    <input type="date" class="form-control" id="taskStartDate" name="taskStartDate" value="${task.startDate}">
                </div>
                <div class="mb-4">
                    <h4>End Date:</h4>
                    <input type="date" class="form-control" id="taskEndDate" name="taskEndDate" value="${task.endDate}">
                </div>
                <button type="submit" class="btn globalBgColor ms-3">Update Task</button>
            </section>
        </form>


        <script>
            async function sendTask(event) {
                event.preventDefault();

                const confirmation = confirm('Are you sure you want to update this task?');
                if (!confirmation) {
                    return;
                }

                var projectId = document.getElementById("projectId").value;
                var taskId = document.getElementById("taskId").value;
                var taskName = document.getElementById("taskName").value;
                var taskImg = document.getElementById("taskImg").value;
                var description = document.getElementById("taskDescription").value;
                var startDate = document.getElementById("taskStartDate").value;
                var endDate = document.getElementById("taskEndDate").value;
                var taskStatus = document.getElementById("taskStatus").value;

                const taskData = {
                    projectId: projectId,
                    taskId: taskId,
                    taskName: taskName,
                    taskImg: taskImg,
                    description: description,
                    startDate: startDate,
                    endDate: endDate,
                    status: taskStatus
                };

                try {
                    const response = await fetch(`${pageContext.request.contextPath}/UpdateTaskServlet`, {
                        method: 'POST',
                        headers: {
                            'Accept': 'application/json',
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(taskData)
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

            document.getElementById('taskForm').addEventListener('submit', sendTask);

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

</body>

</html>

