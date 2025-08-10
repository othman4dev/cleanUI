{if $announcementsFbRecommend}
    <script>
        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) {
                return;
            }
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/{$LANG.locale}/all.js#xfbml=1";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>
{/if}

<div class="announcements-header">
    <div class="announcements-header-content">
        <h1 class="announcements-title">
            <i class="bi bi-megaphone"></i>
            Announcements
        </h1>
        <p class="announcements-subtitle">Stay updated with our latest news and important information</p>
    </div>
</div>

<div class="announcements-container">
    {foreach from=$announcements item=announcement}
        <div class="announcement-card">
            <div class="announcement-header">
                <div class="announcement-date">
                    <i class="bi bi-calendar3"></i>
                    <span>{$carbon->createFromTimestamp($announcement.timestamp)->format('jS M Y')}</span>
                </div>
                {if $announcement.editLink}
                    <a href="{$announcement.editLink}" class="announcement-edit">
                        <i class="bi bi-pencil"></i>
                        {$LANG.edit}
                    </a>
                {/if}
            </div>
            
            <div class="announcement-body">
                <h2 class="announcement-title">
                    <a href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}">
                        {$announcement.title}
                    </a>
                </h2>
                
                <div class="announcement-content">
                    {if $announcement.text|strip_tags|strlen < 350}
                        <p>{$announcement.text}</p>
                    {else}
                        <p>{$announcement.summary}</p>
                        <a href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" class="read-more-btn">
                            <i class="bi bi-arrow-right"></i>
                            {$LANG.readmore}
                        </a>
                    {/if}
                </div>
            </div>
            
            <div class="announcement-footer">
                <a href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" class="announcement-link-btn">
                    <i class="bi bi-eye"></i>
                    Read Full Article
                </a>
                
                {if $announcementsFbRecommend}
                    <div class="announcement-social">
                        <div class="fb-like hidden-sm hidden-xs" data-layout="button_count" data-href="{fqdnRoutePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" data-send="false" data-width="120" data-show-faces="false" data-action="recommend"></div>
                        <div class="fb-like hidden-lg hidden-md" data-layout="button_count" data-href="{fqdnRoutePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" data-send="false" data-width="120" data-show-faces="false" data-action="recommend"></div>
                    </div>
                {/if}
            </div>
        </div>
    {foreachelse}
        <div class="announcements-empty">
            <i class="bi bi-megaphone"></i>
            <h3>No Announcements</h3>
            <p>{$LANG.noannouncements}</p>
        </div>
    {/foreach}
</div>

{if $prevpage || $nextpage}
    <div class="announcements-pagination">
        <div class="pagination-container">
            {if $prevpage}
                <a href="{routePath('announcement-index-paged', $prevpage, $view)}" class="pagination-btn prev">
                    <i class="bi bi-chevron-left"></i>
                    {$LANG.previouspage}
                </a>
            {/if}
            
            <div class="pagination-info">
                <span class="page-indicator">
                    <i class="bi bi-file-earmark-text"></i>
                    {$LANG.page} {$pagenumber}
                </span>
            </div>
            
            {if $nextpage}
                <a href="{routePath('announcement-index-paged', $nextpage, $view)}" class="pagination-btn next">
                    {$LANG.nextpage}
                    <i class="bi bi-chevron-right"></i>
                </a>
            {/if}
        </div>
    </div>
{/if}
