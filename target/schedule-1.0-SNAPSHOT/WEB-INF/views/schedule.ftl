<#ftl strip_whitespace = true>

<#import "/spring.ftl" as spring>

<#assign charset="UTF-8">
<#assign title="Example">
<#assign security=JspTaglibs["http://www.springframework.org/security/tags"]>
<html>
    <head>
    <@security.csrfMetaTags>
        <title>Schedule</title>
        <link rel="stylesheet" type="text/css" href="<@spring.url '/css/style.css'/>" />
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
        <script src="<@spring.url '/js/common.js'/>"></script>
        </head>
    <body>
    <#include 'template/links.ftl'>

        <p>Teacher: ${teacherName}</p>

    <#if isAdmin>
        <a href="<@spring.url '/admin/subjects/${id}'/>">Edit subjects</a>
    </#if>

        <table id="scheduleTable">
            <tr bgcolor="#faebd7">
                <th width="50px"></th>
                <#list weekDays as day>
                <th width="100px">${day}</th>
                </#list>
                </tr>
            <#list 0..pairIntervals.size() - 1 as pair>
            <tr>
                <td bgcolor="#faebd7" align="center">${pairIntervals.get(pair)}</td>
                <#list 0..weekDays.size() - 1 as day>
                <#assign value = schedule[pair][day]>
                <#if !isAdmin>
            <td align="${value == null ? 'center' : 'left'}">
                    ${value == null ? '-' : value}
                </td>
                </#if>
                <#if isAdmin>
            <td>
                <select>
                    <option value="-" ${value == null ? 'selected' : ''}>-</option>
                        <#list subjects as subject>
                    <option value="${subject}" ${subject == value ? 'selected' : ''}>${subject}</option>
                        </#list>
                    </select>
                </td>
                </#if>
            </#list>
            </tr>
            </#list>
        </table>

    <#if isAdmin>
    <input type="button" value="update" onclick="updateSchedule('${id}', '${pairIntervals.size()}', '${weekDays.size()}')">
    </#if>

    </body>
</html>
