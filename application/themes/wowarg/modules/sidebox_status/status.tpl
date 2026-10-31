{foreach from=$realms key=key item=realm}
    {$realmId = $realm->getId()}

    <div id="realm_{$realmId}" class="wowarg-realm {strtolower($realm->getExpansionSmallName())} {if $realm->isOnline()}online{else}offline{/if}" {if $key != 0}style="display:none"{/if}>

        <div class="wowarg-realm-name">
            <span class="wowarg-realm-indicator {if $realm->isOnline()}wowarg-online{else}wowarg-offline{/if}"></span>
            <span class="wowarg-realm-title">{$realm->getName()}</span>
            <span class="wowarg-realm-status-text">{if $realm->isOnline()}{lang('global_online', 'theme_wowarg')}{else}{lang('global_offline', 'theme_wowarg')}{/if}</span>
        </div>

        <div class="wowarg-realm-stats">
            <div class="wowarg-realm-stat">
                <i class="fas fa-users"></i>
                <span>
                    {if $realm->isOnline()}
                        <strong>{$realm->getOnline()}</strong> {lang('sidebox_status_onlineplayers', 'theme_wowarg')}
                    {else}
                        {lang('global_offline', 'theme_wowarg')}
                    {/if}
                </span>
            </div>
            <div class="wowarg-realm-stat">
                <i class="fas fa-network-wired"></i>
                <span>{lang('sidebox_status_setrealmlist', 'theme_wowarg')} <code class="wowarg-realmlist-code">{$realmlist}</code></span>
            </div>
            {if isset($realm_desc[$realmId])}
                <div class="wowarg-realm-desc">{$realm_desc[$realmId]}</div>
            {/if}
        </div>
    </div>
{/foreach}

{if count($realms) > 1}
    <div class="wowarg-realm-pagination">
        {foreach from=$realms key=key item=realm}
            <button class="wowarg-realm-dot {if $key == 0}active{/if}"
                    onclick="CustomJS.switchRealm(this, '#realm_{$realm->getId()}')"
                    aria-label="{$realm->getName()}"></button>
        {/foreach}
    </div>
{/if}
