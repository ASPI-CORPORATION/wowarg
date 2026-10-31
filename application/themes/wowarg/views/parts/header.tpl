<!-- Header/Navbar.Start -->
<header id="header" class="wowarg-header">
    <div class="wowarg-header-container">

        <!-- Logo -->
        <a href="{$url}" class="wowarg-logo" title="Bienvenido a {$serverName}">
            <span class="wowarg-logo-icon"><i class="fas fa-dragon"></i></span>
            <span class="wowarg-logo-text">
                <span class="wowarg-logo-main">WoW</span>
                <span class="wowarg-logo-sub">Argentina</span>
            </span>
        </a>

        <!-- Desktop Navigation -->
        <nav class="wowarg-nav" id="wowarg-nav" aria-label="Menu principal">
            <ul class="wowarg-nav-list">
                {foreach from=$menu_top item=menu}
                    {if $menu.parent_id != 0}{continue}{/if}
                    {if $menu.dropdown}
                        <li class="wowarg-nav-item wowarg-nav-dropdown">
                            <a href="#" class="wowarg-nav-link" aria-haspopup="true" aria-expanded="false" title="{$menu.name}">
                                {$menu.name} <i class="fas fa-chevron-down wowarg-nav-arrow"></i>
                            </a>
                            <ul class="wowarg-dropdown" role="menu">
                                {foreach from=$menu_top item=d_menu}
                                    {if $d_menu.parent_id != $menu.id}{continue}{/if}
                                    <li class="wowarg-dropdown-item" role="none">
                                        <a {$d_menu.link} class="wowarg-dropdown-link {if $d_menu.active}active{/if}" title="{$d_menu.name}" data-hasevent="1" role="menuitem">{$d_menu.name}</a>
                                    </li>
                                {/foreach}
                            </ul>
                        </li>
                    {else}
                        <li class="wowarg-nav-item">
                            <a {$menu.link} class="wowarg-nav-link {if $menu.active}active{/if}" title="{$menu.name}" data-hasevent="1">{$menu.name}</a>
                        </li>
                    {/if}
                {/foreach}
            </ul>
        </nav>

        <!-- User actions (desktop) -->
        <div class="wowarg-header-actions">
            {if $isOnline}
                <a href="{$url}ucp" class="wowarg-btn wowarg-btn-sm wowarg-btn-outline" data-hasevent="1">
                    <i class="fas fa-user"></i> {lang("accmenu_panel", "theme_wowarg")}
                </a>
                <a href="{$url}logout" class="wowarg-btn wowarg-btn-sm wowarg-btn-ghost" data-hasevent="1" title="{lang('accmenu_logout', 'theme_wowarg')}">
                    <i class="fas fa-sign-out-alt"></i>
                </a>
            {else}
                <a href="{$url}login" class="wowarg-btn wowarg-btn-sm wowarg-btn-outline" data-hasevent="1">
                    <i class="fas fa-sign-in-alt"></i> {lang("nlaccmenu_login", "theme_wowarg")}
                </a>
                <a href="{$url}register" class="wowarg-btn wowarg-btn-sm wowarg-btn-primary" data-hasevent="1">
                    <i class="fas fa-user-plus"></i> {lang("nlaccmenu_register", "theme_wowarg")}
                </a>
            {/if}
        </div>

        <!-- Mobile toggle -->
        <button class="wowarg-mobile-toggle" id="wowarg-mobile-toggle" aria-label="Abrir men&uacute;" aria-expanded="false" aria-controls="wowarg-mobile-menu">
            <span></span><span></span><span></span>
        </button>

    </div>

    <!-- Mobile overlay -->
    <div class="wowarg-mobile-overlay" id="wowarg-mobile-overlay" role="presentation"></div>

    <!-- Mobile menu panel -->
    <nav class="wowarg-mobile-menu" id="wowarg-mobile-menu" aria-label="Men&uacute; m&oacute;vil" hidden>
        <div class="wowarg-mobile-menu-header">
            <span class="wowarg-mobile-logo">
                <i class="fas fa-dragon"></i> WoW Argentina
            </span>
            <button class="wowarg-mobile-close" id="wowarg-mobile-close" aria-label="Cerrar men&uacute;">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <ul class="wowarg-mobile-nav-list">
            {foreach from=$menu_top item=menu}
                {if $menu.parent_id != 0}{continue}{/if}
                <li class="wowarg-mobile-nav-item">
                    {if $menu.dropdown}
                        <span class="wowarg-mobile-nav-link wowarg-mobile-parent">
                            {$menu.name} <i class="fas fa-chevron-down"></i>
                        </span>
                        <ul class="wowarg-mobile-sub" style="display:none">
                            {foreach from=$menu_top item=d_menu}
                                {if $d_menu.parent_id != $menu.id}{continue}{/if}
                                <li><a {$d_menu.link} class="wowarg-mobile-sub-link {if $d_menu.active}active{/if}" data-hasevent="1">{$d_menu.name}</a></li>
                            {/foreach}
                        </ul>
                    {else}
                        <a {$menu.link} class="wowarg-mobile-nav-link {if $menu.active}active{/if}" data-hasevent="1">{$menu.name}</a>
                    {/if}
                </li>
            {/foreach}
        </ul>
        <div class="wowarg-mobile-actions">
            {if $isOnline}
                <a href="{$url}ucp" class="wowarg-btn wowarg-btn-outline wowarg-btn-block" data-hasevent="1"><i class="fas fa-user"></i> {lang("accmenu_panel", "theme_wowarg")}</a>
                <a href="{$url}logout" class="wowarg-btn wowarg-btn-ghost wowarg-btn-block" data-hasevent="1"><i class="fas fa-sign-out-alt"></i> {lang("accmenu_logout", "theme_wowarg")}</a>
            {else}
                <a href="{$url}login" class="wowarg-btn wowarg-btn-outline wowarg-btn-block" data-hasevent="1"><i class="fas fa-sign-in-alt"></i> {lang("nlaccmenu_login", "theme_wowarg")}</a>
                <a href="{$url}register" class="wowarg-btn wowarg-btn-primary wowarg-btn-block" data-hasevent="1"><i class="fas fa-user-plus"></i> {lang("nlaccmenu_register", "theme_wowarg")}</a>
            {/if}
        </div>
    </nav>
</header>
<!-- Header/Navbar.End -->
