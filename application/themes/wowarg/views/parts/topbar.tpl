<!-- Topbar.Start -->
<div id="wowarg-topbar" class="wowarg-topbar">
    <div class="wowarg-topbar-container">
        <div class="wowarg-topbar-left">
            <span class="wowarg-topbar-server-info">
                <i class="fas fa-dragon"></i>
                <span>WotLK 3.3.5a &bull; AzerothCore</span>
            </span>
            {if $social['discord']['enabled']}
            <a href="{$social['discord']['link']}" target="_blank" rel="noopener noreferrer" class="wowarg-topbar-social" title="Discord">
                <i class="fab fa-discord"></i>
            </a>
            {/if}
            {if $social['facebook']['enabled']}
            <a href="{$social['facebook']['link']}" target="_blank" rel="noopener noreferrer" class="wowarg-topbar-social" title="Facebook">
                <i class="fab fa-facebook-f"></i>
            </a>
            {/if}
            {if $social['twitter']['enabled']}
            <a href="{$social['twitter']['link']}" target="_blank" rel="noopener noreferrer" class="wowarg-topbar-social" title="Twitter / X">
                <i class="fab fa-x-twitter"></i>
            </a>
            {/if}
            {if $social['youtube']['enabled']}
            <a href="{$social['youtube']['link']}" target="_blank" rel="noopener noreferrer" class="wowarg-topbar-social" title="YouTube">
                <i class="fab fa-youtube"></i>
            </a>
            {/if}
            {if $social['instagram']['enabled']}
            <a href="{$social['instagram']['link']}" target="_blank" rel="noopener noreferrer" class="wowarg-topbar-social" title="Instagram">
                <i class="fab fa-instagram"></i>
            </a>
            {/if}
        </div>

        <div class="wowarg-topbar-right">
            {if $isOnline}
                <div class="wowarg-topbar-user">
                    <a href="{$url}ucp/avatar" class="wowarg-topbar-avatar-link" title="Avatar">
                        <img src="{$CI->user->getAvatar()}" width="20" height="20" alt="Avatar" class="wowarg-topbar-avatar">
                    </a>
                    <span class="wowarg-topbar-welcome">{lang("uinfo_welcome", "theme_wowarg")}
                        <a href="{$url}profile/{$CI->user->getId()}" class="wowarg-topbar-username">{$CI->user->getNickname()}</a>
                    </span>
                    <span class="wowarg-topbar-sep">|</span>
                    <span class="wowarg-topbar-points">
                        <i class="fas fa-coins wowarg-gold-icon" title="Donation Points"></i> {$CI->user->getDp()}
                        &nbsp;
                        <i class="fas fa-vote-yea wowarg-silver-icon" title="Vote Points"></i> {$CI->user->getVp()}
                    </span>
                    <span class="wowarg-topbar-sep">|</span>
                    <a href="{$url}ucp" class="wowarg-topbar-link" data-hasevent="1">{lang("accmenu_panel", "theme_wowarg")}</a>
                    <span class="wowarg-topbar-sep">|</span>
                    <a href="{$url}logout" class="wowarg-topbar-link" data-hasevent="1">{lang("accmenu_logout", "theme_wowarg")}</a>
                </div>
            {else}
                <div class="wowarg-topbar-guest">
                    <span class="wowarg-topbar-welcome">{lang("nluinfo_welcome", "theme_wowarg")}</span>
                    <span class="wowarg-topbar-sep">|</span>
                    <a href="{$url}login" class="wowarg-topbar-link" data-hasevent="1">{lang("nlaccmenu_login", "theme_wowarg")}</a>
                    <span class="wowarg-topbar-sep">|</span>
                    <a href="{$url}register" class="wowarg-topbar-link wowarg-topbar-register" data-hasevent="1">{lang("nlaccmenu_register", "theme_wowarg")}</a>
                </div>
            {/if}
        </div>
    </div>
</div>
<!-- Topbar.End -->
