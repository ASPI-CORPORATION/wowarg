{foreach from=$realms key=key item=realm}
    {$realmId = $realm->getId()}
    <div id="realm_{$realmId}" class="wowarg-realm {if $realm->isOnline()}online{else}offline{/if}">
        <span class="wowarg-realm-indicator {if $realm->isOnline()}wowarg-online{else}wowarg-offline{/if}"></span>
        {if $realm->isOnline()}
            <strong>{$realm->getOnline()}</strong> {lang('sidebox_status_onlineplayers', 'theme_wowarg')}
        {else}
            {lang('global_offline', 'theme_wowarg')}
        {/if}
    </div>
{/foreach}
