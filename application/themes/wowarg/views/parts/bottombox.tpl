<!-- Bottombox.Start -->
{if $sideboxes_bottom}
<section class="wowarg-bottombox">
    <div class="container-fluid">
        <div class="row g-4 justify-content-center">
            {foreach from=$sideboxes_bottom item=sidebox}
                <div class="col-sm-12 col-md-6 col-lg-4">
                    <section class="wowarg-sidebox wowarg-sidebox-bottom wowarg-sidebox-type-{$sidebox.type}">
                        <h3 class="wowarg-sidebox-title">
                            {$sidebox.name}
                        </h3>
                        <div class="wowarg-sidebox-body">
                            {$sidebox.data}
                        </div>
                    </section>
                </div>
            {/foreach}
        </div>
    </div>
</section>
{/if}
<!-- Bottombox.End -->
