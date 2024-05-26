
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

        <form id="resourceForm" enctype="multipart/form-data">
            <input class="form-control mb-4" type="hidden" id="taskId" value="${taskId}">
            <div>
                <h4>Resource Name:</h4>
                <input class="form-control mb-4" type="text" placeholder="Enter Name" id="resourceName" name="resourceName">
            </div>
            <div class="mb-4">
                <h4>Resource Image:</h4>
                <input class="form-control mb-4" type="text" placeholder="Enter Name" id="resourceImg" name="resourceImg">
            </div>
            <div class="mb-4">
                <h4>Type:</h4>
                <select class="form-select" id="resourceType" name="resourceType">
                    <option value="EQUIPMENT">Equipment</option>
                    <option value="PERSONNEL">Personnel</option>
                    <option value="MATERIALS">Materials</option>
                    <option value="SOFTWARE">Software</option>
                </select>
            </div>
            <div class="mb-4">
                <h4>Quantity:</h4>
                <input type="number" class="form-control" id="quantity" name="quantity" placeholder="Enter Quantity">
            </div>
            <div class="mb-4">
                <h4>Supplier Information:</h4>
                <input class="form-control mb-4" type="text" placeholder="Enter Supplier Information" id="supplierInformation" name="supplierInformation">
            </div>
            <button type="submit" class="btn globalBgColor ms-3">Add Resource</button>
        </form>

        <script>
            async function sendResource(event) {
                event.preventDefault();

                const confirmation = confirm('Are you sure you want to add this resource?');
                if (!confirmation) {
                    return;
                }

                var taskId = document.getElementById("taskId").value;
                var resourceName = document.getElementById("resourceName").value;
                var resourceImg = document.getElementById("resourceImg").value;
                var resourceType = document.getElementById("resourceType").value;
                var quantity = document.getElementById("quantity").value;
                var supplierInformation = document.getElementById("supplierInformation").value;

                const resourceData = {
                    taskId: taskId,
                    resourceName: resourceName,
                    resourceImg: resourceImg,
                    resourceType: resourceType,
                    quantity: quantity,
                    supplierInformation: supplierInformation
                };

                try {
                    const response = await fetch(`${pageContext.request.contextPath}/AddResourceServlet`, {
                        method: 'POST',
                        headers: {
                            'Accept': 'application/json',
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(resourceData)
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

            document.getElementById('resourceForm').addEventListener('submit', sendResource);

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

