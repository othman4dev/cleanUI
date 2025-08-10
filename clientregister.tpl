{if in_array('state', $optionalFields)}
    <script>
        var statesTab = 10;
        var stateNotRequired = true;
    </script>
{/if}

<script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
<script type="text/javascript" src="{$BASE_PATH_JS}/PasswordStrength.js"></script>
<script>
    window.langPasswordStrength = "{$LANG.pwstrength}";
    window.langPasswordWeak = "{$LANG.pwstrengthweak}";
    window.langPasswordModerate = "{$LANG.pwstrengthmoderate}";
    window.langPasswordStrong = "{$LANG.pwstrengthstrong}";
    jQuery(document).ready(function()
    {
        jQuery("#inputNewPassword1").keyup(registerFormPasswordStrengthFeedback);
    });
</script>
{if $registrationDisabled}
    {include file="$template/includes/alert.tpl" type="error" msg=$LANG.registerCreateAccount|cat:' <strong><a href="cart.php" class="alert-link">'|cat:$LANG.registerCreateAccountOrder|cat:'</a></strong>'}
{/if}

{if $errormessage}
    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
{/if}

{if !$registrationDisabled}
<div class="register-page">
    <div class="register-container">
        <div class="register-card">
            <!-- Logo Section -->
            <div class="register-header">
                {if $assetLogoPath}
                    <a href="{$WEB_ROOT}/index.php" class="login-logo">
                        <img src="{$assetLogoPath}" alt="{$companyname}" />
                    </a>
                {else}
                    <div class="login-logo">
                        <h3 class="logo-font">HOLLANDNODE</h3>
                    </div>
                {/if}
                <h2 class="register-title">Create Account</h2>
                <p class="register-subtitle">Join us today and get started</p>
            </div>

            <!-- Navigation Links -->
            <div class="register-navigation">
                <a href="{$WEB_ROOT}/clientarea.php" class="register-nav-link">
                    <i class="bi bi-box-arrow-in-right"></i>
                    {$LANG.login}
                </a>
                <span class="register-nav-divider">or</span>
                <a href="{$WEB_ROOT}/register.php" class="register-nav-link active">
                    <i class="bi bi-person-plus"></i>
                    {$LANG.register}
                </a>
            </div>

            <!-- Social Registration Section -->
            <div class="register-social">
                {include file="$template/includes/linkedaccounts.tpl" linkContext="registration"}
            </div>

            <div id="registration">
                <form method="post" class="register-form using-password-strength" action="{$smarty.server.PHP_SELF}" role="form" name="orderfrm" id="frmCheckout">
                    <input type="hidden" name="register" value="true"/>

                    <div id="containerNewUserSignup">
                        <!-- Personal Information Section -->
                        <div class="register-section">
                            <div class="register-section-header">
                                <h3 class="register-section-title">
                                    <i class="bi bi-person-fill"></i>
                                    {$LANG.orderForm.personalInformation}
                                </h3>
                            </div>
                            
                            <div class="register-row">
                                <div class="register-form-group">
                                    <label for="inputFirstName" class="register-label">
                                        <i class="bi bi-person-fill"></i>
                                        {$LANG.orderForm.firstName}
                                    </label>
                                    <div class="register-input-wrapper">
                                        <input type="text" name="firstname" id="inputFirstName" class="register-input" placeholder="{$LANG.orderForm.firstName}" value="{$clientfirstname}" {if !in_array('firstname', $optionalFields)}required{/if} autofocus>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="register-row">
                                <div class="register-form-group">
                                    <label for="inputEmail" class="register-label">
                                        <i class="bi bi-envelope-fill"></i>
                                        {$LANG.orderForm.emailAddress}
                                    </label>
                                    <div class="register-input-wrapper">
                                        <input type="email" name="email" id="inputEmail" class="register-input" placeholder="{$LANG.orderForm.emailAddress}" value="{$clientemail}" required>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Billing Address Section -->
                        <div class="register-section hidden">
                            <div class="register-form-group">
                                <label for="inputCountry" class="register-label">
                                    <i class="bi bi-globe"></i>
                                    Country
                                </label>
                                <div class="register-input-wrapper">
                                    <select name="country" id="inputCountry" class="register-input register-select" required>
                                        {foreach $clientcountries as $countryCode => $countryName}
                                            <option value="{$countryCode}"{if (!$clientcountry && $countryCode eq $defaultCountry) || ($countryCode eq $clientcountry)} selected="selected"{/if}>
                                                {$countryName}
                                            </option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                        </div>

                        {if $customfields || $currencies}
                        <!-- Additional Information Section -->
                        <div class="register-section">
                            <div class="register-section-header">
                                <h3 class="register-section-title">
                                    <i class="bi bi-info-circle-fill"></i>
                                    {$LANG.orderadditionalrequiredinfo}
                                </h3>
                            </div>
                            
                            {if $customfields}
                                {foreach $customfields as $customfield}
                                    <div class="register-form-group">
                                        <label for="customfield{$customfield.id}" class="register-label">
                                            <i class="bi bi-gear-fill"></i>
                                            {$customfield.name}
                                        </label>
                                        <div class="register-input-wrapper">
                                            {$customfield.input}
                                            {if $customfield.description}
                                                <span class="register-help-text">{$customfield.description}</span>
                                            {/if}
                                        </div>
                                    </div>
                                {/foreach}
                            {/if}
                            
                            {if $currencies}
                                <div class="register-form-group">
                                    <label for="inputCurrency" class="register-label">
                                        <i class="bi bi-currency-dollar"></i>
                                        Currency
                                    </label>
                                    <div class="register-input-wrapper">
                                        <select id="inputCurrency" name="currency" class="register-input register-select">
                                            {foreach from=$currencies item=curr}
                                                <option value="{$curr.id}"{if !$smarty.post.currency && $curr.default || $smarty.post.currency eq $curr.id } selected{/if}>{$curr.code}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                </div>
                            {/if}
                        </div>
                        {/if}
                    </div>
                    
                    <div id="containerNewUserSecurity"{if $remote_auth_prelinked && !$securityquestions } class="register-hidden"{/if}>
                        <!-- Account Security Section -->
                        <div class="register-section">
                            <div class="register-section-header">
                                <h3 class="register-section-title">
                                    <i class="bi bi-shield-lock-fill"></i>
                                    {$LANG.orderForm.accountSecurity}
                                </h3>
                            </div>
                            
                            <div id="containerPassword" class="register-password-section{if $remote_auth_prelinked && $securityquestions} register-hidden{/if}">
                                <div id="passwdFeedback" style="display: none;" class="register-password-feedback"></div>
                                
                                <div class="register-row">
                                    <div class="register-form-group">
                                        <label for="inputNewPassword1" class="register-label">
                                            <i class="bi bi-lock-fill"></i>
                                            {$LANG.clientareapassword}
                                        </label>
                                        <div class="register-input-wrapper">
                                            <input type="password" name="password" id="inputNewPassword1" data-error-threshold="{$pwStrengthErrorThreshold}" data-warning-threshold="{$pwStrengthWarningThreshold}" class="register-input" placeholder="{$LANG.clientareapassword}" autocomplete="new-password"{if $remote_auth_prelinked} value="{$password}"{/if} required>
                                        </div>
                                    </div>
                                    <div class="register-form-group">
                                        <label for="inputNewPassword2" class="register-label">
                                            <i class="bi bi-lock-fill"></i>
                                            {$LANG.clientareaconfirmpassword}
                                        </label>
                                        <div class="register-input-wrapper">
                                            <input type="password" name="password2" id="inputNewPassword2" class="register-input" placeholder="{$LANG.clientareaconfirmpassword}" autocomplete="new-password"{if $remote_auth_prelinked} value="{$password}"{/if} required>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="register-password-tools">
                                    <button type="button" class="register-generate-btn generate-password" data-targetfields="inputNewPassword1,inputNewPassword2">
                                        <i class="bi bi-key-fill"></i>
                                        {$LANG.generatePassword.btnLabel}
                                    </button>
                                    <div class="register-password-strength">
                                        <div class="password-strength-meter">
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" id="passwordStrengthMeterBar">
                                                </div>
                                            </div>
                                            <p class="register-password-strength-text" id="passwordStrengthTextLabel">{$LANG.pwstrength}: {$LANG.pwstrengthenter}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            {if $securityquestions}
                                <div class="register-form-group">
                                    <label for="inputSecurityQId" class="register-label">
                                        <i class="bi bi-question-circle-fill"></i>
                                        {$LANG.clientareasecurityquestion}
                                    </label>
                                    <div class="register-input-wrapper">
                                        <select name="securityqid" id="inputSecurityQId" class="register-input register-select">
                                            <option value="">{$LANG.clientareasecurityquestion}</option>
                                            {foreach $securityquestions as $question}
                                                <option value="{$question.id}"{if $question.id eq $securityqid} selected{/if}>
                                                    {$question.question}
                                                </option>
                                            {/foreach}
                                        </select>
                                    </div>
                                </div>
                                <div class="register-form-group">
                                    <label for="inputSecurityQAns" class="register-label">
                                        <i class="bi bi-key-fill"></i>
                                        {$LANG.clientareasecurityanswer}
                                    </label>
                                    <div class="register-input-wrapper">
                                        <input type="password" name="securityqans" id="inputSecurityQAns" class="register-input" placeholder="{$LANG.clientareasecurityanswer}" autocomplete="off">
                                    </div>
                                </div>
                            {/if}
                        </div>
                    </div>

                    {if $showMarketingEmailOptIn}
                        <!-- Marketing Opt-in Section -->
                        <div class="register-section">
                            <div class="register-marketing">
                                <div class="register-marketing-header">
                                    <h4>
                                        <i class="bi bi-envelope-heart-fill"></i>
                                        {lang key='emailMarketing.joinOurMailingList'}
                                    </h4>
                                    <p>{$marketingEmailOptInMessage}</p>
                                </div>
                                <div class="register-marketing-toggle">
                                    <input type="checkbox" name="marketingoptin" value="1"{if $marketingEmailOptIn} checked{/if} class="register-checkbox" id="marketingOptIn">
                                    <label for="marketingOptIn" class="register-checkbox-label">
                                        <i class="bi bi-check2"></i>
                                        Yes, I want to receive marketing emails
                                    </label>
                                </div>
                            </div>
                        </div>
                    {/if}

                    <!-- CAPTCHA Section -->
                    {if $captcha->isEnabled()}
                        <div class="register-section">
                            <div class="register-captcha">
                                <label class="register-label">
                                    <i class="bi bi-shield-check"></i>
                                    Security Verification
                                </label>
                                {include file="$template/includes/captcha.tpl"}
                            </div>
                        </div>
                    {/if}

                    {if $accepttos}
                        <!-- Terms of Service Section -->
                        <div class="register-section">
                            <div class="register-tos">
                                <div class="register-tos-header">
                                    <h4>
                                        <i class="bi bi-exclamation-triangle-fill"></i>
                                        {$LANG.ordertos}
                                    </h4>
                                </div>
                                <div class="register-tos-content">
                                    <input type="checkbox" name="accepttos" class="register-checkbox accepttos" id="acceptTos" required>
                                    <label for="acceptTos" class="register-checkbox-label">
                                        <i class="bi bi-check2"></i>
                                        {$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank" class="register-tos-link">{$LANG.ordertos}</a>
                                    </label>
                                </div>
                            </div>
                        </div>
                    {/if}

                    <!-- Submit Button -->
                    <div class="register-submit">
                        <button type="submit" class="register-btn{$captcha->getButtonClass($captchaForm)}">
                            <i class="bi bi-person-plus-fill"></i>
                            {$LANG.clientregistertitle}
                        </button>
                    </div>
                </form>
            </div>

            <!-- Additional Info -->
            <div class="register-footer">
                <p>
                    <i class="bi bi-shield-check"></i>
                    Your information is secure and protected
                </p>
            </div>
        </div>
    </div>
</div>
{/if}
