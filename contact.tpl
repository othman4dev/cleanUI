{if $sent}
    {include file="$template/includes/alert.tpl" type="success" msg=$LANG.contactsent textcenter=true}
{/if}

{if $errormessage}
    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
{/if}

{if !$sent}
<div class="contact-section">
    <div class="divider-25"></div>
    <div class="contact-header">
        <h2 class="contact-title">
            <i class="bi bi-envelope-fill contact-icon"></i>
            Contact Us
        </h2>
        <p class="contact-description">We will be happy to receive your message, and will respond almost immediately.</p>
    </div>
    
    <div class="contact-info-cards">
        <div class="contact-info-card">
            <i class="bi bi-clock-fill"></i>
            <h4>Response Time</h4>
            <p>Within 24 hours</p>
        </div>
        <div class="contact-info-card">
            <i class="bi bi-headset"></i>
            <h4>Support</h4>
            <p>Professional help</p>
        </div>
        <div class="contact-info-card">
            <i class="bi bi-shield-check"></i>
            <h4>Secure</h4>
            <p>Your data is safe</p>
        </div>
    </div>
    
    <div class="divider-25"></div>
    <form method="post" action="contact.php" class="form-horizontal contact-form" role="form">
            <input type="hidden" name="action" value="send" />
            
            <div class="form-row">
                <div class="double-input">
                    <div class="input-label">
                        <label for="inputName" class="contact-label">
                            <i class="bi bi-person-fill"></i>
                            {$LANG.supportticketsclientname}
                        </label>
                        <div class="input-wrapper">
                            <input type="text" name="name" placeholder="John Doe" value="{$name}" class="contact-input" id="inputName" required />
                        </div>
                    </div>
                    <div class="input-label">
                        <label for="inputEmail" class="contact-label">
                            <i class="bi bi-envelope-fill"></i>
                            {$LANG.supportticketsclientemail}
                        </label>
                        <div class="input-wrapper">
                            <input type="email" name="email" value="{$email}" placeholder="example@email.com" class="contact-input" id="inputEmail" required />
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="form-row">
                <div class="input-label">
                    <label for="inputSubject" class="contact-label">
                        <i class="bi bi-chat-left-text-fill"></i>
                        {$LANG.supportticketsticketsubject}
                    </label>
                    <div class="input-wrapper">
                        <input type="text" name="subject" value="{$subject}" placeholder="Question about... / Information about... /..." class="contact-input" id="inputSubject" required />
                    </div>
                </div>
            </div>
            
            <div class="form-row">
                <div class="input-label">
                    <label for="inputMessage" class="contact-label">
                        <i class="bi bi-textarea-resize"></i>
                        {$LANG.contactmessage}
                    </label>
                    <div class="input-wrapper">
                        <textarea name="message" placeholder="Your message here..." rows="6" class="contact-input contact-textarea" id="inputMessage" required>{$message}</textarea>
                    </div>
                </div>
            </div>

                

            <div class="button-wrapper">
                <button type="reset" class="contact-cancel">
                    <i class="bi bi-arrow-counterclockwise"></i>
                    {$LANG.cancel}
                </button>
                <button type="submit" class="contact-btn">
                    <i class="bi bi-send-fill"></i>
                    {$LANG.contactsend}
                </button>
            </div>
            <div class="divider-100"></div>
    </form>
</div>
    

{/if}
