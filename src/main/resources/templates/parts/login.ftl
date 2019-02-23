<#macro login path isRegisterForm>

<form action="${path}" method="post">
    <div class="col-md-4">
        <div class="login-panel panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Sign In</h3>
            </div>
            <div class="panel-body">
                <form role="form">
                    <fieldset>
                        <div class="form-group">
                            <input
                                    class="form-control ${(usernameError??)?string('is-invalid', '')}"
                                    placeholder="User name"
                                    name="username"
                                    type="text"
                                    autofocus=""
                                    value="<#if user??>${user.username}</#if>"

                            />
                                <#if usernameError??>
                                <div class="invalid-feedback">
                                    ${usernameError}
                                </div>
                                </#if>
                        </div>
                        <div class="form-group">
                            <input class="form-control ${(passwordError??)?string('is-invalid', '')}"
                                   placeholder="Password"
                                   name="password"
                                   type="password"
                                   value=""
                            />
                                <#if passwordError??>
                                <div class="invalid-feedback">
                                    ${passwordError}
                                </div>
                                </#if>
                        </div>
    <#if isRegisterForm>
                       <div class="form-group">
                           <input class="form-control ${(password2Error??)?string('is-invalid', '')}"
                                  placeholder="re-Password"
                                  name="password2"
                                  type="password"
                                  value=""
                           />
                                <#if passwordError??>
                                <div class="invalid-feedback">
                                    ${password2Error}
                                </div>
                                </#if>
                       </div>
                       <div class="form-group">
                           <input class="form-control ${(emailError??)?string('is-invalid', '')}"
                                  placeholder="some@some.com"
                                  name="email"
                                  type="email"
                                  value="<#if user??>${user.email}</#if>"
                           />
                                <#if emailError??>
                                <div class="invalid-feedback">
                                    ${emailError}
                                </div>
                                </#if>
                       </div>
    <div class="col-sm-6">
    <div class="g-recaptcha" data-sitekey="6LffbJIUAAAAAPlP9n3ayKIcezMhBTLPs8HmJCuO"></div>
    <#if captchaError??>
    <div class="alert alert-danger" role="alert">
    ${captchaError}
    </div>
    </#if>
    </div>

    </#if>
                        <input type="hidden" name="_csrf" value="${_csrf.token}" />
<#if !isRegisterForm><a href="/registration">Add new user</a></#if>
                        <button class="btn btn-primary" type="submit"><#if isRegisterForm>Create<#else>Sign In</#if></button>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>





</form>



<#--<form action="${path}" method="post">-->
    <#--<div class="form-group row">-->
        <#--<label class="col-sm-2 col-form-label">User Name :</label>-->
        <#--<div class="col-sm-6">-->
            <#--<input type="text" name="username" value="<#if user??>${user.username}</#if>"-->
                   <#--class="form-control ${(usernameError??)?string('is-invalid', '')}"-->
                   <#--placeholder="User name" />-->
            <#--<#if usernameError??>-->
                <#--<div class="invalid-feedback">-->
                    <#--${usernameError}-->
                <#--</div>-->
            <#--</#if>-->
        <#--</div>-->
    <#--</div>-->
    <#--<div class="form-group row">-->
        <#--<label class="col-sm-2 col-form-label">Password:</label>-->
        <#--<div class="col-sm-6">-->
            <#--<input type="password" name="password"-->
                   <#--class="form-control ${(passwordError??)?string('is-invalid', '')}"-->
                   <#--placeholder="Password" />-->
            <#--<#if passwordError??>-->
                <#--<div class="invalid-feedback">-->
                    <#--${passwordError}-->
                <#--</div>-->
            <#--</#if>-->
        <#--</div>-->
    <#--</div>-->



    <#--<#if isRegisterForm>-->

        <#--<div class="form-group row">-->
            <#--<label class="col-sm-2 col-form-label">Password:</label>-->
            <#--<div class="col-sm-6">-->
                <#--<input type="password" name="password2"-->
                       <#--class="form-control ${(password2Error??)?string('is-invalid', '')}"-->
                       <#--placeholder="Retype password" />-->
                <#--<#if password2Error??>-->
                    <#--<div class="invalid-feedback">-->
                        <#--${password2Error}-->
                    <#--</div>-->
                <#--</#if>-->
            <#--</div>-->
        <#--</div>-->

        <#--<div class="form-group row">-->
            <#--<label class="col-sm-2 col-form-label">Email:</label>-->
            <#--<div class="col-sm-6">-->
                <#--<input type="email" name="email" value="<#if user??>${user.email}</#if>"-->
                       <#--class="form-control ${(emailError??)?string('is-invalid', '')}"-->
                       <#--placeholder="some@some.com" />-->
                <#--<#if emailError??>-->
                    <#--<div class="invalid-feedback">-->
                        <#--${emailError}-->
                    <#--</div>-->
                <#--</#if>-->
            <#--</div>-->
        <#--</div>-->
        <#--<div class="col-sm-6">-->
            <#--<div class="g-recaptcha" data-sitekey="6LffbJIUAAAAAPlP9n3ayKIcezMhBTLPs8HmJCuO"></div>-->
            <#--<#if captchaError??>-->
                <#--<div class="alert alert-danger" role="alert">-->
                    <#--${captchaError}-->
                <#--</div>-->
            <#--</#if>-->
        <#--</div>-->
    <#--</#if>-->
    <#--<input type="hidden" name="_csrf" value="${_csrf.token}" />-->
    <#--<#if !isRegisterForm><a href="/registration">Add new user</a></#if>-->
    <#--<button class="btn btn-primary" type="submit"><#if isRegisterForm>Create<#else>Sign In</#if></button>-->
<#--</form>-->
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button class="btn btn-primary" type="submit"><#if user??>Sign Out<#else>Log in</#if></button>
</form>
</#macro>