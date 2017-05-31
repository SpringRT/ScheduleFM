<#import "/spring.ftl" as spring>

<#assign charset="UTF-8">
<#assign title="Example">
<#assign security=JspTaglibs["http://www.springframework.org/security/tags"]>

<p>
    <a href="<@spring.url '/'/>">Go to home page</a> or
    
    <@security.authorize access="!isAuthenticated()">
        <a href="<@spring.url '/login'/>">login</a>
    </@security.authorize>
    <@security.authorize access="isAuthenticated()">
        <a href="<@spring.url '/login?logout'/>">logout</a>
    </@security.authorize>
</p>