<!-- Sidebox.Start -->
{if $sideboxes}
    {foreach from=$sideboxes item=sidebox}
        <section class="wowarg-sidebox wowarg-sidebox-type-{$sidebox.type}">
            <h3 class="wowarg-sidebox-title">
                {$sidebox.name}
            </h3>
            <div class="wowarg-sidebox-body">
                {$sidebox.data}
            </div>
        </section>
    {/foreach}
{/if}
<!-- Sidebox.End -->
