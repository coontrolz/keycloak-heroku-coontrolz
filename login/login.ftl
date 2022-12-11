<#import "template.ftl" as layout>
<#--  <#import "common/heading.ftl" as heading>  -->
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
    <#if section = "header">
        ${msg("doTitle")}
    <#elseif section = "subheader">
        ${msg("doLogIn")}
        <p  class="${properties.SignInTitileClass!}">${msg("SignInTitile")}</p>
    <#elseif section = "form">
    <div id="kc-form" <#if realm.password && social.providers??>class="${properties.kcContentWrapperClass!}"</#if>>
      <div id="kc-form-wrapper" <#if realm.password && social.providers??>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <div class="${properties.kcFormGroupClass!}">
                  

                    <#if usernameEditDisabled??>
                        <input tabindex="1" id="username" placeholder="${msg("username")}" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled />
                     <img src=" ${url.resourcesPath}/icon/email.png"  class=${properties.EmailIconClasss!}   />
                    <#else>
                        <input tabindex="1" id="username" placeholder="${msg("username")}" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off" />
                         <img src=" ${url.resourcesPath}/icon/email.png"  class=${properties.EmailIconClasss!}  />
                    </#if>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                   
                    <input tabindex="2" id="password"  placeholder="${msg("password")}" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off" />
                     <img src=" ${url.resourcesPath}/icon/password.png"  class=${properties.EmailIconClasss!}  />
                </div>

                <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!} row">
                    <div id="kc-form-options" class="col-md-6 col-lg-6">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="checkbox">
                                <label>
                                    <#if login.rememberMe??>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                    <#else>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                    </#if>
                                </label>
                            </div>
                        </#if>
                    </div>
                        <div class="${properties.kcFormOptionsWrapperClass!} col-md-6 col-lg-6 text-right">
                            <#if realm.resetPasswordAllowed>
                                <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                            </#if>
                        </div>

                  </div>

                  <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                    <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogInBtn")}"/>
                  </div>
            </form>
        </#if>
        </div>
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}">
                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 4>${properties.kcFormSocialAccountDoubleListClass!}</#if>">
                    <#list social.providers as p>
                        <li class="${properties.kcFormSocialAccountListLinkClass!}"><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span>${p.displayName}</span></a></li>
                    </#list>
                </ul>
            </div>
        </#if>
      </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
            <div id="kc-registration">
                <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}" data-testid="register" class="register-footer-link" >${msg("doRegister")}</a></span>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
