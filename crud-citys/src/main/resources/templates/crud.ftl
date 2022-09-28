<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv ="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width , initial-scale=1.0">
    <title>Crud Cidades</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>

<div class="container-fluid">
        <div class="jumbotron mt-5">
            <h1>City Management</h1>
            <p>CRUD to create, update, delete and list citys</p>
        </div>
        <#if actualCity??>
        <form action="/edit" method="POST">
            <form action="/edit" method="POST">
                <input type="hidden" name="actualName" value="${(actualCity.name)!}"/>
                <input type="hidden" name="actualState" value="${(actualCity.state)!}"/>
                <#else>
                <form action="/create" method="POST">
                    </#if>

            <div class="form-group">
                <label for="name"> City:</label>
                <input value="${(actualCity.name)!}" name = "name" type="text" class="form-control" placeholder="Enter the name of city" id="name">
            </div>
            <div class="form-group">
                <label for="state">State</label>
                <input value="${(actualCity.state)!}" name = "state" type="text" class="form-control" placeholder="Enter the state" id="state">
            </div>
            <#if actualCity??>
            <button type="submit" class="btn btn-primary">FINSISH CREATE</button>
            <#else>
                <button type="submit" class="btn btn-primary">CREATE</button>
            </#if>
        </form>
                <div>
        <table class="table tabble-striped table-hover mt-5">
            <thead class="thead-dark">
            <tr>
                <th>Name</th>
                <th>State</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
                <#list listCitys as city>
                    <tr>
                        <td>${city.name}</td>
                        <td>${city.state}</td>
                        <td>
                            <div class="d-flex d-justify-content-center">
                                <a href="/prepareToedit?name=${city.name}&state=${city.state}" class="btn btn-warning mr-3">Edit</a>
                                <a href="/delete?name=${city.name}&state=${city.state}" class="btn btn-danger">Delete</a>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </#list>
        </table>
    </div>
</body>
</html>