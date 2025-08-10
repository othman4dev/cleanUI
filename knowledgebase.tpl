<div class="kb-hero">
    <div class="kb-hero-content">
        <h1 class="kb-hero-title">Knowledge Base</h1>
        <p class="kb-hero-subtitle">Find answers to your questions and learn how to get the most out of our services</p>
        
        <form role="form" method="post" action="{routePath('knowledgebase-search')}" class="kb-search-form">
            <div class="kb-search-container">
                <div class="kb-search-input-group">
                    <i class="bi bi-search kb-search-icon"></i>
                    <input type="text" id="inputKnowledgebaseSearch" name="search" class="kb-search-input" placeholder="{$LANG.clientHomeSearchKb}" />
                    <button type="submit" id="btnKnowledgebaseSearch" class="kb-search-btn">
                        <i class="bi bi-arrow-right"></i>
                        {$LANG.search}
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="kb-categories-section">
    <div class="kb-section-header">
        <h2 class="kb-section-title">
            <i class="bi bi-folder2-open"></i>
            {$LANG.knowledgebasecategories}
        </h2>
        <p class="kb-section-subtitle">Browse articles by category</p>
    </div>

    {if $kbcats}
        <div class="kb-categories-grid">
            {foreach from=$kbcats name=kbcats item=kbcat}
                <div class="kb-category-card">
                    <a href="{routePath('knowledgebase-category-view', {$kbcat.id}, {$kbcat.urlfriendlyname})}" class="kb-category-link">
                        <div class="kb-category-icon">
                            <i class="bi bi-folder2"></i>
                        </div>
                        <div class="kb-category-content">
                            <h3 class="kb-category-title">{$kbcat.name}</h3>
                            <span class="kb-category-count">{$kbcat.numarticles} {if $kbcat.numarticles == 1}article{else}articles{/if}</span>
                            <p class="kb-category-description">{$kbcat.description}</p>
                        </div>
                        <div class="kb-category-arrow">
                            <i class="bi bi-arrow-right"></i>
                        </div>
                    </a>
                    {if $kbcat.editLink}
                        <a href="{$kbcat.editLink}" class="kb-admin-edit">
                            <i class="bi bi-pencil"></i>
                            {$LANG.edit}
                        </a>
                    {/if}
                </div>
            {/foreach}
        </div>
    {else}
        <div class="kb-empty-state">
            <i class="bi bi-inbox"></i>
            <h3>No Articles Available</h3>
            <p>{$LANG.knowledgebasenoarticles}</p>
        </div>
    {/if}
</div>

{if $kbmostviews}
    <div class="kb-popular-section">
        <div class="kb-section-header">
            <h2 class="kb-section-title">
                <i class="bi bi-fire"></i>
                {$LANG.knowledgebasepopular}
            </h2>
            <p class="kb-section-subtitle">Most viewed articles</p>
        </div>

        <div class="kb-articles-grid">
            {foreach from=$kbmostviews item=kbarticle}
                <div class="kb-article-card">
                    <a href="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}" class="kb-article-link">
                        <div class="kb-article-icon">
                            <i class="bi bi-file-text"></i>
                        </div>
                        <div class="kb-article-content">
                            <h3 class="kb-article-title">{$kbarticle.title}</h3>
                            <p class="kb-article-excerpt">{$kbarticle.article|truncate:120:"..."}</p>
                            <div class="kb-article-meta">
                                <span class="kb-article-badge">Popular</span>
                            </div>
                        </div>
                        <div class="kb-article-arrow">
                            <i class="bi bi-arrow-right"></i>
                        </div>
                    </a>
                    {if $kbarticle.editLink}
                        <a href="{$kbarticle.editLink}" class="kb-admin-edit">
                            <i class="bi bi-pencil"></i>
                            {$LANG.edit}
                        </a>
                    {/if}
                </div>
            {/foreach}
        </div>
    </div>
{/if}
