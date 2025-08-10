<div class="products-header">
    <div class="products-header-content">
        <h1 class="products-title">
            <i class="bi bi-server"></i>
            My Products & Services
        </h1>
        <p class="products-subtitle">Manage your hosting services, VPS, and other products</p>
    </div>
</div>

<div class="products-controls">
    <div class="products-stats">
        <div class="product-stat">
            <span class="stat-number">{$services|count}</span>
            <span class="stat-label">Total Services</span>
        </div>
        <div class="product-stat">
            <span class="stat-number">{assign var="active" value=0}{foreach $services as $service}{if $service.status eq 'Active'}{assign var="active" value=$active+1}{/if}{/foreach}{$active}</span>
            <span class="stat-label">Active</span>
        </div>
        <div class="product-stat">
            <span class="stat-number">{assign var="suspended" value=0}{foreach $services as $service}{if $service.status eq 'Suspended'}{assign var="suspended" value=$suspended+1}{/if}{/foreach}{$suspended}</span>
            <span class="stat-label">Suspended</span>
        </div>
    </div>
</div>

<div class="products-container">
    <div class="products-grid">
        {foreach key=num item=service from=$services}
            <div class="product-card" data-service-id="{$service.id}">
                <div class="product-card-header">
                    <div class="product-ssl">
                        {if $service.sslStatus}
                            <img src="{$service.sslStatus->getImagePath()}" data-toggle="tooltip" title="{$service.sslStatus->getTooltipContent()}" class="ssl-icon {$service.sslStatus->getClass()}"/>
                        {elseif !$service.isActive}
                            <img src="{$BASE_PATH_IMG}/ssl/ssl-inactive-domain.png" data-toggle="tooltip" title="{lang key='sslState.sslInactiveService'}" class="ssl-icon">
                        {/if}
                    </div>
                    <div class="product-status">
                        <span class="status-badge status-{$service.status|strtolower}">{$service.statustext}</span>
                    </div>
                </div>
                
                <div class="product-card-body">
                    <div class="product-icon">
                        <i class="bi bi-{if $service.product|strpos:'VPS' !== false}hdd-stack{elseif $service.product|strpos:'Dedicated' !== false}server{elseif $service.product|strpos:'Cloud' !== false}cloud{elseif $service.product|strpos:'Email' !== false}envelope{elseif $service.product|strpos:'SSL' !== false}shield-check{else}box{/if}"></i>
                    </div>
                    
                    <h3 class="product-name">{$service.product}</h3>
                    
                    {if $service.domain}
                        <div class="product-domain">
                            <a href="http://{$service.domain}" target="_blank" class="domain-link">
                                <i class="bi bi-globe"></i>
                                {$service.domain}
                            </a>
                        </div>
                    {/if}
                    
                    <div class="product-info">
                        <div class="product-info-item">
                            <span class="info-label">Billing:</span>
                            <span class="info-value">{$service.amount} / {$service.billingcycle}</span>
                        </div>
                        <div class="product-info-item">
                            <span class="info-label">Next Due:</span>
                            <span class="info-value">{$service.nextduedate}</span>
                        </div>
                    </div>
                </div>
                
                <div class="product-card-actions">
                    <a href="clientarea.php?action=productdetails&id={$service.id}" class="product-action-btn primary">
                        <i class="bi bi-gear"></i>
                        Manage Service
                    </a>
                </div>
            </div>
        {/foreach}
    </div>
    
    {if !$services}
        <div class="products-empty">
            <i class="bi bi-server"></i>
            <h3 style="font-size: 2.5rem;">No Services Found</h3>
            <p style="font-size: 1.5rem;">You don't have any active services yet.</p>
            <a href="cart.php" class="btn-order-service">
                <i class="bi bi-plus-circle" style="margin: 0;"></i>
                Order Your First Service
            </a>
        </div>
    {/if}
</div>
