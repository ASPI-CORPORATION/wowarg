{include file="{$theme_path}configure/global.tpl" scope="parent"}
{include file="{$theme_path}views/header.tpl" scope="parent"}

<body class="wowarg-body ltr{if $show_slider} has-slider{/if}">

    {include file="{$theme_path}views/modals.tpl"}
    {include file="{$theme_path}views/parts/topbar.tpl"}
    {include file="{$theme_path}views/parts/header.tpl"}

    {if $show_slider}{include file="{$theme_path}views/parts/slider.tpl"}{/if}

    <section class="wowarg-content">
        {$showSidebox = in_array($moduleName, $sidebox_modules)}
        {if isset($is404) && in_array("errors", $sidebox_modules)}{$showSidebox = true}{/if}
        <div class="container-fluid">
            <div class="row">
                <div id="wowarg-mainbar" class="col-sm-12 col{if $showSidebox}-lg-8{/if}">
                    {include file="{$theme_path}views/parts/topbox.tpl"}
                    {$page}
                </div>

                {if $showSidebox}
                <div id="wowarg-sidebar" class="col-sm-12 col-lg-4">
                    <nav class="wowarg-sidenav">
                        <ul class="wowarg-sidenav-list">
                            {foreach from=$menu_side item=menu}
                                <li class="wowarg-sidenav-item">
                                    <a {$menu.link} class="wowarg-sidenav-link {if $menu.active}active{/if}" title="{$menu.name}" data-hasevent="1">
                                        <i class="fas fa-chevron-right"></i>
                                        <span>{$menu.name}</span>
                                    </a>
                                </li>
                            {/foreach}
                        </ul>
                    </nav>
                    {include file="{$theme_path}views/parts/sidebox.tpl"}
                </div>
                {/if}
            </div>
        </div>
    </section>

    {include file="{$theme_path}views/parts/bottombox.tpl"}
    {include file="{$theme_path}views/parts/footer.tpl"}

    <a href="#" id="back-to-top" class="wowarg-back-to-top" title="Volver arriba" aria-label="Volver arriba">
        <i class="fas fa-chevron-up"></i>
    </a>

</body>
</html>
