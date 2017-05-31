<#ftl strip_whitespace = true>

<#import "/spring.ftl" as spring>

<#assign charset="UTF-8">
<#assign title="Example">
<#assign security=JspTaglibs["http://www.springframework.org/security/tags"]>
<html>
    <head>
    <@security.csrfMetaTags/>
        <link rel="stylesheet" type="text/css" href="<@spring.url '/css/style.css'/>">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
        <script src="<@spring.url '/js/common.js'/>"></script>
        <title>${title}</title>
        </head>
    <body>
    <#include 'template/links.ftl'>

    <#if description != null>
        <table>
            <#list description as entry>
            <tr>
                <td width="100px"><b>${entry.key}</b></td>
                <td width="100px">${entry.value}</td>
                </tr>
            </#list>
            </table>
    </#if>

    <#if items != null>
        <p><input type="text" id="filterInput" onkeyup="filterFunction()" placeholder="${prefix} filter" title="Filter" size="49"></p>
        <table id="itemsTable">
            <tr bgcolor="#faebd7">
                <th width="300px">${prefix}</th>
                <th width="30px">view</th>
                <#if isAdmin>
                <th width="30px">id</th>
                <th width="50px">
                    </#if>
                    </th>
                </tr>
            <#list items as entry>
            <tr>
                <td>${entry.value}</td>
                <td><a href="<@spring.url '/${prefix}/${entry.key}'/>">view</a></td>
                <#if isAdmin>
                <td>${entry.key}</td>
                <td><input type="button" value="delete" onclick="deleteRow(this, '${prefix}')"></td>
                    </#if>
                </tr>
            </#list>
    </#if>

            <#if isAdmin && htmlInput != null>
            <p>Create new ${prefix}:</p>
            <table id="newInstanceTable">
                    <#list htmlInput as entry>
                <tr>
                    <td width="100px">${entry.key}</td>
                    <td width="100px"><input type="${entry.value}" name="${entry.key}"></td>
                    </tr>
                        </#list>
                </table>
            <input type="button" value="create" onclick="create('${prefix}', ${categoryId})">
                </#if>

                <#if isCategoryTeacher>
            <p>View schedule: <a href="<@spring.url '/schedule/${categoryId}'/>">view</a></p>
                </#if>

        </body>
    </html>
