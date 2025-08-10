<div class="tickets-wrapper">
    <div class="tickets-header">
        <div class="tickets-header-content">
            <h1 class="tickets-title">
                <i class="bi bi-chat-dots"></i>
                Support Tickets
            </h1>
            <p class="tickets-subtitle">View and manage your support requests</p>
        </div>
        <div class="tickets-actions">
            <a href="submitticket.php" class="btn-new-ticket">
                <i class="bi bi-plus-circle"></i>
                Create New Ticket
            </a>
        </div>
    </div>
    
    <div class="tickets-controls">
        {include file="$template/includes/tablelist.tpl" tableName="TicketsList" filterColumn="2"}
        <div class="tickets-stats">
            <div class="ticket-stat">
                <span class="stat-number">{if $tickets}{$tickets|count}{else}0{/if}</span>
                <span class="stat-label">Total Tickets</span>
            </div>
            <div class="ticket-stat">
                <span class="stat-number">{assign var="open" value=0}{if $tickets}{foreach $tickets as $ticket}{if $ticket.statusClass eq 'open'}{assign var="open" value=$open+1}{/if}{/foreach}{/if}{$open}</span>
                <span class="stat-label">Open</span>
            </div>
            <div class="ticket-stat">
                <span class="stat-number">{assign var="answered" value=0}{if $tickets}{foreach $tickets as $ticket}{if $ticket.statusClass eq 'answered'}{assign var="answered" value=$answered+1}{/if}{/foreach}{/if}{$answered}</span>
                <span class="stat-label">Answered</span>
            </div>
        </div>
    </div>
    
    <div class="tickets-container">
        {if $tickets}
            <div class="tickets-grid">
                {foreach from=$tickets item=ticket}
                    <div class="ticket-card" onclick="window.location='viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}'">
                        <div class="ticket-card-header">
                            <div class="ticket-id">
                                <i class="bi bi-hash"></i>
                                <span>{$ticket.tid}</span>
                            </div>
                            <div class="ticket-status">
                                <span class="status-badge status-{$ticket.statusClass}"{if !is_null($ticket.statusColor)} style="background-color: {$ticket.statusColor}; border-color: {$ticket.statusColor};"{/if}>
                                    {$ticket.status|strip_tags}
                                </span>
                            </div>
                        </div>
    
                        <div class="ticket-card-body">
                            <div class="ticket-department">
                                <i class="bi bi-building"></i>
                                <span>{$ticket.department}</span>
                            </div>
    
                            <h3 class="ticket-subject{if $ticket.unread} unread{/if}">
                                {$ticket.subject}
                            </h3>
    
                            <div class="ticket-meta">
                                <div class="ticket-meta-item">
                                    <i class="bi bi-clock"></i>
                                    <span>Last Reply: {$ticket.lastreply}</span>
                                </div>
                            </div>
                        </div>
    
                        <div class="ticket-card-footer">
                            <a href="viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}" class="ticket-view-btn">
                                <i class="bi bi-eye"></i>
                                View Ticket
                            </a>
                        </div>
                    </div>
                {/foreach}
            </div>
        {else}
            <div class="tickets-empty">
                <i class="bi bi-chat-dots"></i>
                <h3>No Support Tickets</h3>
                <p>You haven't submitted any support tickets yet.</p>
                <a href="submitticket.php" class="btn-new-ticket">
                    <i class="bi bi-plus-circle"></i>
                    Submit Your First Ticket
                </a>
            </div>
        {/if}
    </div>
    
    <div id="tableLoading" class="tickets-loading hidden">
        <div class="loading-spinner">
            <i class="bi bi-arrow-clockwise spinning"></i>
            <p>Loading tickets...</p>
        </div>
    </div>
</div>

<script type="text/javascript">
    jQuery(document).ready(function() {
        // Initialize any data tables functionality if needed
        var ticketsGrid = jQuery('.tickets-grid');
        if (ticketsGrid.length > 0) {
            jQuery('#tableLoading').addClass('hidden');
        }
        
        // Add click handlers for ticket cards
        jQuery('.ticket-card').on('click', function(e) {
            if (!jQuery(e.target).closest('.ticket-view-btn').length) {
                var url = jQuery(this).attr('onclick');
                if (url) {
                    eval(url);
                }
            }
        });
    });
</script>
