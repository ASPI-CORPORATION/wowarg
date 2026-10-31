<div class="wowarg-content-header">
    <h2 class="wowarg-section-title">
        <i class="fas fa-newspaper"></i>
        {sprintf(lang('news_latest_news', 'theme_wowarg'), $CI->config->item('server_name'))}
    </h2>
    {if isset($single)}<div class="wowarg-pagination">{str_replace('&nbsp;', '', $pagination)}</div>{/if}
</div>

{foreach from=$articles key=key item=article}
    {$rank = $CI->acl_model->getGroupsByUser($article.author_id)}
    {$rank = end($rank)}

    <article id="post_{$article.id}" class="wowarg-post {if $article.comments != -1}has-comments{/if} {if $article.avatar}has-avatar{/if} {if isset($single)}expandable {if $key != 0}collapsed{/if}{/if}">

        <!-- Post Author -->
        <div class="wowarg-post-author">
            <div class="wowarg-post-avatar">
                <a href="{$url}profile/{$article.author_id}">
                    <img src="{$CI->user->getAvatar($article.author_id)}" width="80" height="80" alt="Avatar" />
                </a>
            </div>
            <div class="wowarg-post-author-name">
                <a href="{$url}profile/{$article.author_id}">{$article.author}</a>
            </div>
            {if isset($rank)}
                <div class="wowarg-post-rank" {if $rank.color}style="background-color:{$rank.color}"{/if}>{$rank.name}</div>
            {/if}
            <a href="{$url}messages/create/{$article.author_id}" class="wowarg-post-pm" title="{sprintf(lang('news_send_pm', 'theme_wowarg'), $article.author)}">
                <i class="fas fa-envelope"></i>
            </a>
        </div>

        <!-- Post Content -->
        <div class="wowarg-post-main" {if isset($single)}style="{if $key == 0}display:block{else}display:none{/if}"{/if}>
            <div class="wowarg-post-header">
                <h3 class="wowarg-post-title">
                    <a href="{$url}news/view/{$article.id}" title="{$article.headline}">{$article.headline}</a>
                </h3>
                <div class="wowarg-post-meta">
                    <span class="wowarg-post-date"><i class="far fa-calendar-alt"></i> {$article.date}</span>
                    <span class="wowarg-post-by">{lang('posted_by', 'news')} <a href="{$url}profile/{$article.author_id}">{$article.author}</a></span>
                    {if $article.comments != -1}
                        <span class="wowarg-post-comments">
                            <a {$article.link} class="comments_button" {$article.comments_button_id} data-comments-container="#comments_{$article.id}">
                                <i class="far fa-comment-alt"></i> {$article.comments} {lang('comments', 'news')}
                            </a>
                        </span>
                    {/if}
                    {if isset($single)}<a href="javascript:void(0)" class="wowarg-post-expand icon icon-expand"></a>{/if}
                </div>
            </div>

            <div class="wowarg-post-body">
                <div class="wowarg-post-content">{$article.content}</div>

                {if $article.tags}
                    <div class="wowarg-post-tags">
                        <i class="fas fa-tags"></i>
                        {foreach from=$article.tags item=tag}
                            <a href="{$url}/news/{$tag.name}" class="wowarg-tag">{$tag.name}</a>
                        {/foreach}
                    </div>
                {/if}
            </div>

            <div class="comments" {$article.comments_id}></div>
        </div>

        {if isset($single)}<div class="wowarg-post-border-fix" {if $key == 0}style="display:none"{/if}></div>{/if}
    </article>
{/foreach}
