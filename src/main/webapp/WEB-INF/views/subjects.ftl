<#ftl strip_whitespace = true>

<#import "/spring.ftl" as spring>

<#assign charset="UTF-8">
<#assign title="Example">
<#assign security=JspTaglibs["http://www.springframework.org/security/tags"]>
<html>
<head>
    <title>Subjects</title>
    <link rel="stylesheet" type="text/css" href="<@spring.url '/css/style.css'/>" />
</head>
<body>
    <#include 'template/links.ftl'>

    <p>Teacher: ${teacherName}</p>

    <p>Back to <a href="<@spring.url '/schedule/${id}'/>">schedule</a></p>

    <form action="<@spring.url '/admin/subjects/${id}'/>" method='POST'>
        <p>Subjects:<br>
            <textarea name="subjects" cols="40" rows="5">${subjects}</textarea>
        </p>
        <input type="submit" value="update"/>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>

</body>
</html>