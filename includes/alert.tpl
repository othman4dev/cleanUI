<div class="custom-alert custom-alert-{if $type eq "error"}danger{elseif $type}{$type}{else}info{/if}{if $textcenter} custom-alert-center{/if}{if $hide} custom-alert-hidden{/if}{if $additionalClasses} {$additionalClasses}{/if}"{if $idname} id="{$idname}"{/if}>
    <div class="custom-alert-icon">
        {if $type eq "error"}
            <i class="bi bi-exclamation-triangle-fill"></i>
        {elseif $type eq "success"}
            <i class="bi bi-check-circle-fill"></i>
        {elseif $type eq "warning"}
            <i class="bi bi-exclamation-circle-fill"></i>
        {else}
            <i class="bi bi-info-circle-fill"></i>
        {/if}
    </div>
    <div class="custom-alert-content">
        {if $errorshtml}
            <div class="custom-alert-title">
                <strong>{$LANG.clientareaerrors}</strong>
            </div>
            <div class="custom-alert-errors">
                {$errorshtml}
            </div>
        {else}
            {if $title}
                <div class="custom-alert-title">
                    <h2>{$title}</h2>
                </div>
            {/if}
            <div class="custom-alert-message">
                {$msg}
            </div>
        {/if}
    </div>
    <button type="button" class="custom-alert-close" onclick="this.parentElement.style.display='none'">
        <i class="bi bi-x-lg"></i>
    </button>
</div>
