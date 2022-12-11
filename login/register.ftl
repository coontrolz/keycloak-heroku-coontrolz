<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("doTitle")}
    <#elseif section = "subheader">
        ${msg("registerTitle")}
    <#elseif section = "form">
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                 
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="email" placeholder="${msg("email")}" class="${properties.kcInputClass!}" name="email" value="${(register.formData.email!'')}" autocomplete="email" />
                     <img src=" ${url.resourcesPath}/icon/email.png"  class=${properties.EmailIconClasss!}   />
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="firstName" placeholder="${msg("firstName")}" class="${properties.kcInputClass!}" name="firstName" value="${(register.formData.firstName!'')}" />
                     <img src=" ${url.resourcesPath}/icon/profile.png"  class=${properties.EmailIconClasss!}   />
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                   
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="lastName" placeholder="${msg("lastName")}"  class="${properties.kcInputClass!}" name="lastName" value="${(register.formData.lastName!'')}" />
                     <img src=" ${url.resourcesPath}/icon/profile.png"  class=${properties.EmailIconClasss!}   />
                </div>
            </div>

          <#if !realm.registrationEmailAsUsername>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                  
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="username"  placeholder="${msg("username")}"  class="${properties.kcInputClass!}" name="username" value="${(register.formData.username!'')}" autocomplete="username" />
                     <img src=" ${url.resourcesPath}/icon/email.png"  class=${properties.EmailIconClasss!}   />
                </div>
            </div>
          </#if>

            <#if passwordRequired>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                  
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="password" id="password"  placeholder="${msg("password")}" class="${properties.kcInputClass!}" name="password" autocomplete="new-password"/>
                      <img src=" ${url.resourcesPath}/icon/password.png"  class=${properties.EmailIconClasss!}  />
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                   
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="password" id="password-confirm" placeholder="${msg("passwordConfirm")}" class="${properties.kcInputClass!}" name="password-confirm" />
                      <img src=" ${url.resourcesPath}/icon/password.png"  class=${properties.EmailIconClasss!}  />
                </div>
            </div>
            </#if>

            <#if recaptchaRequired??>
            <div class="form-group">
                <div class="${properties.kcInputWrapperClass!}">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
            </div>
            </#if>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                    </div>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doRegister")}"/>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
