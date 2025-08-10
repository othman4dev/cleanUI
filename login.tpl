<div class="login-page">
    <div class="login-container">
        <div class="login-card">
            <div class="login-header">
                {if $assetLogoPath}
                    <a href="{$WEB_ROOT}/index.php" class="login-logo">
                        <img src="{$assetLogoPath}" alt="{$companyname}" />
                    </a>
                {else}
                    <div class="login-logo">
                        <h3 class="logo-font">HOLLANDNODE</h3>
                    </div>
                {/if}
                
                <h1 class="login-title">Welcome Back</h1>
                <p class="login-subtitle">Sign in to manage your services</p>
            </div>

            <div class="login-navigation">
                <a href="clientarea.php" class="login-nav-link {if $templatefile == 'login'}active{/if}">
                    <i class="bi bi-person-circle"></i>
                    {$LANG.clientlogin}
                </a>
                <span class="login-nav-divider">|</span>
                <a href="register.php" class="login-nav-link">
                    <i class="bi bi-person-plus"></i>
                    {$LANG.register}
                </a>
            </div>

            {if $incorrect}
                <div class="login-alerts">
                    <div class="custom-alert custom-alert-danger">
                        <div class="custom-alert-icon">
                            <i class="bi bi-exclamation-triangle"></i>
                        </div>
                        <div class="custom-alert-content">
                            <div class="custom-alert-message">
                                {$LANG.loginincorrect}
                            </div>
                        </div>
                    </div>
                </div>
            {/if}

            {if $verificationId}
                <div class="login-alerts">
                    <div class="custom-alert custom-alert-info">
                        <div class="custom-alert-icon">
                            <i class="bi bi-info-circle"></i>
                        </div>
                        <div class="custom-alert-content">
                            <div class="custom-alert-message">
                                {$LANG.verifyaccountemail}
                            </div>
                        </div>
                    </div>
                </div>
            {/if}

            {if $ssoredirect}
                <div class="login-alerts">
                    <div class="custom-alert custom-alert-info">
                        <div class="custom-alert-icon">
                            <i class="bi bi-arrow-right-circle"></i>
                        </div>
                        <div class="custom-alert-content">
                            <div class="custom-alert-message">
                                {$LANG.sso.redirectafterlogin}
                            </div>
                        </div>
                    </div>
                </div>
            {/if}

            {$languagechangelinks}

            <div class="login-social">
                {$socialLoginContent}
            </div>

            <form method="post" action="{$systemurl}dologin.php" class="login-form">
                <input type="hidden" name="goto" value="{$goto}" />

                <div class="login-form-group">
                    <label for="inputEmail" class="login-label">
                        <i class="bi bi-envelope"></i>
                        {$LANG.loginemail}
                    </label>
                    <div class="login-input-wrapper">
                        <input type="email" 
                               name="username" 
                               class="login-input" 
                               id="inputEmail" 
                               placeholder="{$LANG.enteremail}"
                               autocomplete="username"
                               value="{$username}"
                               required />
                    </div>
                </div>

                <div class="login-form-group">
                    <label for="inputPassword" class="login-label">
                        <i class="bi bi-lock"></i>
                        {$LANG.loginpassword}
                    </label>
                    <div class="login-input-wrapper">
                        <input type="password" 
                               name="password" 
                               class="login-input" 
                               id="inputPassword" 
                               placeholder="{$LANG.loginpassword}"
                               autocomplete="current-password"
                               required />
                    </div>
                </div>

                <div class="login-options">
                    <div class="login-remember">
                        <input type="checkbox" name="rememberme" id="rememberme" class="login-checkbox" />
                        <label for="rememberme" class="login-checkbox-label">
                            <i class="bi bi-check"></i>
                            {$LANG.loginrememberme}
                        </label>
                    </div>
                    <a href="pwreset.php" class="login-forgot-link">
                        <i class="bi bi-question-circle"></i>
                        {$LANG.forgotpw}
                    </a>
                </div>

                {if $showCaptcha}
                    <div class="login-captcha">
                        {include file="$template/includes/captcha.tpl"}
                    </div>
                {/if}

                <div class="login-submit">
                    <button type="submit" class="login-btn" id="login">
                        <i class="bi bi-box-arrow-in-right"></i>
                        {$LANG.loginbutton}
                    </button>
                </div>
            </form>

            <div class="login-footer">
                <p>
                    <i class="bi bi-shield-check"></i>
                    {$LANG.loginintrotext}
                </p>
            </div>
        </div>
    </div>
</div>

{literal}
<script>
jQuery(document).ready(function() {
    // Handle form submission animation
    $('#login').click(function(e) {
        var btn = $(this);
        var form = btn.closest('form');
        
        // Check if form is valid
        if (form[0].checkValidity()) {
            btn.html('<i class="bi bi-arrow-clockwise spinning"></i> {/literal}{$LANG.loginbutton}{literal}');
            btn.prop('disabled', true);
            
            // Submit form after animation
            setTimeout(function() {
                form.submit();
            }, 500);
        }
    });
    
    // Auto-focus first empty field
    if (!$('#inputEmail').val()) {
        $('#inputEmail').focus();
    } else if (!$('#inputPassword').val()) {
        $('#inputPassword').focus();
    }
    
    // Add floating label effect
    $('.login-input').on('focus blur', function(e) {
        var $this = $(this);
        var label = $this.prev('.login-label');
        
        if (e.type === 'focus') {
            label.addClass('focused');
        } else if (e.type === 'blur' && !$this.val()) {
            label.removeClass('focused');
        }
    });
    
    // Initialize labels for pre-filled inputs
    $('.login-input').each(function() {
        if ($(this).val()) {
            $(this).prev('.login-label').addClass('focused');
        }
    });
});
</script>
{/literal}