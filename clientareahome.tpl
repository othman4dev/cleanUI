<div class="client-home-wrapper">
    <!-- Welcome Section -->
    <div class="client-welcome-section">
        <div class="client-welcome-header">
            <h1 class="client-welcome-title">
                <i class="bi bi-house-heart-fill"></i>
                Welcome Back
            </h1>
            <p class="client-welcome-subtitle">Manage your services, domains, and account from your dashboard</p>
        </div>
    </div>

    <!-- Stats Dashboard -->
    <div class="client-stats-dashboard">
        <div class="client-stats-grid">
            <div class="client-stat-card" onclick="window.location='clientarea.php?action=services'">
                <a href="clientarea.php?action=services" class="client-stat-link">
                    <div class="client-stat-icon client-stat-services">
                        <i class="bi bi-server"></i>
                    </div>
                    <div class="client-stat-content">
                        <div class="client-stat-number">{$clientsstats.productsnumactive}</div>
                        <div class="client-stat-label">{$LANG.navservices}</div>
                    </div>
                    <div class="client-stat-arrow">
                        <i class="bi bi-arrow-right"></i>
                    </div>
                </a>
            </div>

            {if $registerdomainenabled || $transferdomainenabled}
                <div class="client-stat-card" onclick="window.location='clientarea.php?action=domains'">
                    <a href="clientarea.php?action=domains" class="client-stat-link">
                        <div class="client-stat-icon client-stat-domains">
                            <i class="bi bi-globe2"></i>
                        </div>
                        <div class="client-stat-content">
                            <div class="client-stat-number">{$clientsstats.numactivedomains}</div>
                            <div class="client-stat-label">{$LANG.navdomains}</div>
                        </div>
                        <div class="client-stat-arrow">
                            <i class="bi bi-arrow-right"></i>
                        </div>
                    </a>
                </div>
            {elseif $condlinks.affiliates && $clientsstats.isAffiliate}
                <div class="client-stat-card" onclick="window.location='affiliates.php'">
                    <a href="affiliates.php" class="client-stat-link">
                        <div class="client-stat-icon client-stat-affiliates">
                            <i class="bi bi-people-fill"></i>
                        </div>
                        <div class="client-stat-content">
                            <div class="client-stat-number">{$clientsstats.numaffiliatesignups}</div>
                            <div class="client-stat-label">{$LANG.affiliatessignups}</div>
                        </div>
                        <div class="client-stat-arrow">
                            <i class="bi bi-arrow-right"></i>
                        </div>
                    </a>
                </div>
            {else}
                <div class="client-stat-card" onclick="window.location='clientarea.php?action=quotes'">
                    <a href="clientarea.php?action=quotes" class="client-stat-link">
                        <div class="client-stat-icon client-stat-quotes">
                            <i class="bi bi-file-earmark-text"></i>
                        </div>
                        <div class="client-stat-content">
                            <div class="client-stat-number">{$clientsstats.numquotes}</div>
                            <div class="client-stat-label">{$LANG.quotes}</div>
                        </div>
                        <div class="client-stat-arrow">
                            <i class="bi bi-arrow-right"></i>
                        </div>
                    </a>
                </div>
            {/if}

            <div class="client-stat-card" onclick="window.location='supporttickets.php'">
                <a href="supporttickets.php" class="client-stat-link">
                    <div class="client-stat-icon client-stat-tickets">
                        <i class="bi bi-chat-dots-fill"></i>
                    </div>
                    <div class="client-stat-content">
                        <div class="client-stat-number">{$clientsstats.numactivetickets}</div>
                        <div class="client-stat-label">{$LANG.navtickets}</div>
                    </div>
                    <div class="client-stat-arrow">
                        <i class="bi bi-arrow-right"></i>
                    </div>
                </a>
            </div>

            <div class="client-stat-card" onclick="window.location='clientarea.php?action=invoices'">
                <a href="clientarea.php?action=invoices" class="client-stat-link">
                    <div class="client-stat-icon client-stat-invoices">
                        <i class="bi bi-receipt"></i>
                    </div>
                    <div class="client-stat-content">
                        <div class="client-stat-number">{$clientsstats.numunpaidinvoices}</div>
                        <div class="client-stat-label">{$LANG.navinvoices}</div>
                    </div>
                    <div class="client-stat-arrow">
                        <i class="bi bi-arrow-right"></i>
                    </div>
                </a>
            </div>
        </div>
    </div>

    <!-- Knowledge Base Search -->
    <div class="client-search-section">
        <form role="form" method="post" action="clientarea.php?action=kbsearch" class="client-search-form">
            <div class="client-search-wrapper">
                <div class="client-search-icon">
                    <i class="bi bi-search"></i>
                </div>
                <input type="text" name="search" class="client-search-input" placeholder="{$LANG.clientHomeSearchKb}" />
                <button type="submit" class="client-search-btn">
                    <i class="bi bi-arrow-right"></i>
                </button>
            </div>
        </form>
    </div>

    {foreach from=$addons_html item=addon_html}
        <div class="client-addon-wrapper">
            {$addon_html}
        </div>
    {/foreach}

    <!-- Client Area Panels -->
    <div class="client-panels-section">
        <div class="client-panels-grid">
            <div class="client-panels-column">

                {function name=outputHomePanels}
                    <div menuItemName="{$item->getName()}" class="client-panel client-panel-{$item->getExtra('color')}{if $item->getClass()} {$item->getClass()}{/if}"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
                        <div class="client-panel-header">
                            <h3 class="client-panel-title">
                                {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>{/if}
                                {$item->getLabel()}
                                {if $item->hasBadge()}<span class="client-panel-badge">{$item->getBadge()}</span>{/if}
                            </h3>
                            {if $item->getExtra('btn-link') && $item->getExtra('btn-text')}
                                <div class="client-panel-action">
                                    <a href="{$item->getExtra('btn-link')}" class="client-panel-btn client-panel-btn-{$item->getExtra('color')}">
                                        {if $item->getExtra('btn-icon')}<i class="{$item->getExtra('btn-icon')}"></i>{/if}
                                        {$item->getExtra('btn-text')}
                                    </a>
                                </div>
                            {/if}
                        </div>
                        {if $item->hasBodyHtml()}
                            <div class="client-panel-body">
                                {$item->getBodyHtml()}
                            </div>
                        {/if}
                        {if $item->hasChildren()}
                            <div class="client-panel-list{if $item->getChildrenAttribute('class')} {$item->getChildrenAttribute('class')}{/if}">
                                {foreach $item->getChildren() as $childItem}
                                    {if $childItem->getUri()}
                                        <a menuItemName="{$childItem->getName()}" href="{$childItem->getUri()}" class="client-panel-list-item{if $childItem->getClass()} {$childItem->getClass()}{/if}{if $childItem->isCurrent()} client-panel-list-active{/if}"{if $childItem->getAttribute('dataToggleTab')} data-toggle="tab"{/if}{if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if} id="{$childItem->getId()}">
                                            <div class="client-panel-list-content">
                                                <div class="client-panel-list-icon">
                                                    {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>{else}<i class="bi bi-circle-fill"></i>{/if}
                                                </div>
                                                <div class="client-panel-list-text">
                                                    {$childItem->getLabel()}
                                                </div>
                                                {if $childItem->hasBadge()}
                                                    <div class="client-panel-list-badge">{$childItem->getBadge()}</div>
                                                {/if}
                                                <div class="client-panel-list-arrow">
                                                    <i class="bi bi-chevron-right"></i>
                                                </div>
                                            </div>
                                        </a>
                                    {else}
                                        <div menuItemName="{$childItem->getName()}" class="client-panel-list-item client-panel-list-static{if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}">
                                            <div class="client-panel-list-content">
                                                <div class="client-panel-list-icon">
                                                    {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>{else}<i class="bi bi-circle-fill"></i>{/if}
                                                </div>
                                                <div class="client-panel-list-text">
                                                    {$childItem->getLabel()}
                                                </div>
                                                {if $childItem->hasBadge()}
                                                    <div class="client-panel-list-badge">{$childItem->getBadge()}</div>
                                                {/if}
                                            </div>
                                        </div>
                                    {/if}
                                {/foreach}
                            </div>
                        {/if}
                        {if $item->hasFooterHtml()}
                            <div class="client-panel-footer">
                                {$item->getFooterHtml()}
                            </div>
                        {/if}
                    </div>
                {/function}

                {foreach $panels as $item}
                    {if $item@iteration is odd}
                        {outputHomePanels}
                    {/if}
                {/foreach}

            </div>
            <div class="client-panels-column">

                {foreach $panels as $item}
                    {if $item@iteration is even}
                        {outputHomePanels}
                    {/if}
                {/foreach}

            </div>
        </div>
    </div>
</div>
