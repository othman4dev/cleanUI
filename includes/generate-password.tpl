<form action="#" id="frmGeneratePassword" class="password-generator-form">
    <div class="modal fade" id="modalGeneratePassword">
        <div class="modal-dialog password-generator-dialog">
            <div class="modal-content password-generator-modal">
                <div class="modal-header password-generator-header">
                    <div class="password-generator-title-section">
                        <h4 class="password-generator-title">
                            <i class="bi bi-key-fill"></i>
                            {$LANG.generatePassword.title}
                        </h4>
                        <button type="button" class="password-generator-close" data-dismiss="modal" aria-label="Close">
                            <i class="bi bi-x-lg"></i>
                        </button>
                    </div>
                </div>
                <div class="modal-body password-generator-body">
                    <div class="password-generator-alert hidden" id="generatePwLengthError">
                        <i class="bi bi-exclamation-triangle-fill"></i>
                        {$LANG.generatePassword.lengthValidationError}
                    </div>
                    
                    <div class="password-generator-form-group">
                        <label for="inputGeneratePasswordLength" class="password-generator-label">
                            <i class="bi bi-gear-fill"></i>
                            {$LANG.generatePassword.pwLength}
                        </label>
                        <div class="password-generator-input-wrapper">
                            <input type="number" min="8" max="64" value="12" step="1" class="password-generator-input" id="inputGeneratePasswordLength">
                            <span class="password-generator-range">8-64 characters</span>
                        </div>
                    </div>
                    
                    <div class="password-generator-form-group">
                        <label for="inputGeneratePasswordOutput" class="password-generator-label">
                            <i class="bi bi-shield-lock-fill"></i>
                            {$LANG.generatePassword.generatedPw}
                        </label>
                        <div class="password-generator-output-wrapper">
                            <input type="text" class="password-generator-input password-generator-output" id="inputGeneratePasswordOutput" readonly>
                            <button type="button" class="password-generator-copy-btn copy-to-clipboard" data-clipboard-target="#inputGeneratePasswordOutput" title="Copy to clipboard">
                                <i class="bi bi-clipboard"></i>
                            </button>
                        </div>
                    </div>
                    
                    <div class="password-generator-actions">
                        <button type="submit" class="password-generator-btn password-generator-btn-generate">
                            <i class="bi bi-arrow-clockwise"></i>
                            {$LANG.generatePassword.generateNew}
                        </button>
                    </div>
                    
                    <div class="password-generator-info">
                        <div class="password-generator-info-card">
                            <i class="bi bi-shield-check"></i>
                            <div>
                                <h5>Secure Generation</h5>
                                <p>Uses cryptographically secure random generation</p>
                            </div>
                        </div>
                        <div class="password-generator-info-card">
                            <i class="bi bi-eye-slash-fill"></i>
                            <div>
                                <h5>Privacy Protected</h5>
                                <p>Generated locally, never stored on servers</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer password-generator-footer">
                    <button type="button" class="password-generator-btn password-generator-btn-secondary" data-dismiss="modal">
                        <i class="bi bi-x-circle"></i>
                        {$LANG.close}
                    </button>
                    <button type="button" class="password-generator-btn password-generator-btn-primary" id="btnGeneratePasswordInsert" data-clipboard-target="#inputGeneratePasswordOutput">
                        <i class="bi bi-check-circle-fill"></i>
                        {$LANG.generatePassword.copyAndInsert}
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>
