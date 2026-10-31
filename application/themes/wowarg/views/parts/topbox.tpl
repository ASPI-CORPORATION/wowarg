<!-- Topbox.Start -->
{if $sideboxes_top}
<div class="wowarg-topbox">
    {foreach from=$sideboxes_top item=sidebox}
        <section class="wowarg-sidebox wowarg-sidebox-top wowarg-sidebox-type-{$sidebox.type}">
            <h3 class="wowarg-sidebox-title">
                {$sidebox.name}
            </h3>
            <div class="wowarg-sidebox-body">
                {$sidebox.data}
            </div>
        </section>
    {/foreach}
</div>
{/if}
<!-- Topbox.End -->
