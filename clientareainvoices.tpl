<div class="client-home-wrapper">
<div class="invoices-header">
    <div class="invoices-header-content">
        <h1 class="invoices-title">
            <i class="bi bi-receipt"></i>
            My Invoices
        </h1>
        <p class="invoices-subtitle">View and manage your billing invoices</p>
    </div>
    <div class="invoices-actions">
        <a href="clientarea.php?action=addfunds" class="btn-add-funds">
            <i class="bi bi-plus-circle"></i>
            Add Funds
        </a>
    </div>
</div>

<div class="invoices-controls">
    {include file="$template/includes/tablelist.tpl" tableName="InvoicesList" filterColumn="4"}
    <div class="invoices-stats">
        <div class="invoice-stat">
            <span class="stat-number">{if $invoices}{$invoices|count}{else}0{/if}</span>
            <span class="stat-label">Total Invoices</span>
        </div>
        <div class="invoice-stat">
            <span class="stat-number">{assign var="paid" value=0}{if $invoices}{foreach $invoices as $invoice}{if $invoice.statusClass eq 'paid'}{assign var="paid" value=$paid+1}{/if}{/foreach}{/if}{$paid}</span>
            <span class="stat-label">Paid</span>
        </div>
        <div class="invoice-stat">
            <span class="stat-number">{assign var="unpaid" value=0}{if $invoices}{foreach $invoices as $invoice}{if $invoice.statusClass eq 'unpaid'}{assign var="unpaid" value=$unpaid+1}{/if}{/foreach}{/if}{$unpaid}</span>
            <span class="stat-label">Unpaid</span>
        </div>
        <div class="invoice-stat">
            <span class="stat-number">{assign var="overdue" value=0}{if $invoices}{foreach $invoices as $invoice}{if $invoice.statusClass eq 'overdue'}{assign var="overdue" value=$overdue+1}{/if}{/foreach}{/if}{$overdue}</span>
            <span class="stat-label">Overdue</span>
        </div>
    </div>
</div>

<div class="invoices-container">
    {if $invoices}
        <div class="invoices-grid">
            {foreach key=num item=invoice from=$invoices}
                <div class="invoice-card" onclick="clickableSafeRedirect(event, 'viewinvoice.php?id={$invoice.id}', false)">
                    <div class="invoice-card-header">
                        <div class="invoice-number">
                            <i class="bi bi-file-earmark-text"></i>
                            <span>#{$invoice.invoicenum}</span>
                        </div>
                        <div class="invoice-status">
                            <span class="status-badge status-{$invoice.statusClass}">
                                {$invoice.status}
                            </span>
                        </div>
                    </div>
                    
                    <div class="invoice-card-body">
                        <div class="invoice-amount">
                            <span class="amount-label">Total Amount</span>
                            <span class="amount-value">{$invoice.total}</span>
                        </div>
                        
                        <div class="invoice-dates">
                            <div class="invoice-date-item">
                                <i class="bi bi-calendar-plus"></i>
                                <div class="date-info">
                                    <span class="date-label">Created</span>
                                    <span class="date-value">{$invoice.datecreated}</span>
                                </div>
                            </div>
                            <div class="invoice-date-item">
                                <i class="bi bi-calendar-event"></i>
                                <div class="date-info">
                                    <span class="date-label">Due Date</span>
                                    <span class="date-value">{$invoice.datedue}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="invoice-card-footer">
                        <a href="viewinvoice.php?id={$invoice.id}" class="invoice-view-btn" onclick="event.stopPropagation();">
                            <i class="bi bi-eye"></i>
                            View Invoice
                        </a>
                        {if $invoice.statusClass eq 'unpaid' || $invoice.statusClass eq 'overdue'}
                            <a href="viewinvoice.php?id={$invoice.id}" class="invoice-pay-btn" onclick="event.stopPropagation();">
                                <i class="bi bi-credit-card"></i>
                                Pay Now
                            </a>
                        {/if}
                    </div>
                </div>
            {/foreach}
        </div>
    {else}
        <div class="invoices-empty">
            <i class="bi bi-receipt"></i>
            <h3>No Invoices Found</h3>
            <p>You don't have any invoices yet.</p>
            <a href="cart.php" class="btn-browse-services">
                <i class="bi bi-shop"></i>
                Browse Services
            </a>
        </div>
    {/if}
</div>

<div id="tableLoading" class="invoices-loading hidden">
    <div class="loading-spinner">
        <i class="bi bi-arrow-clockwise spinning"></i>
        <p>Loading invoices...</p>
    </div>
</div>
</div>

<script type="text/javascript">
    jQuery(document).ready(function() {
        // Initialize any data tables functionality if needed
        var invoicesGrid = jQuery('.invoices-grid');
        if (invoicesGrid.length > 0) {
            jQuery('#tableLoading').addClass('hidden');
        }
        
        // Add click handlers for invoice cards
        jQuery('.invoice-card').on('click', function(e) {
            if (!jQuery(e.target).closest('.invoice-view-btn, .invoice-pay-btn').length) {
                var onclick = jQuery(this).attr('onclick');
                if (onclick) {
                    eval(onclick);
                }
            }
        });
    });
</script>
