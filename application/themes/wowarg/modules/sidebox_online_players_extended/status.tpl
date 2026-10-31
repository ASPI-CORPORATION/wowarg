{foreach from=$realms key=key item=realm}
    {$realmId = $realm->getId()}
    <div id="realm_{$realmId}" class="wowarg-realm {if $realm->isOnline()}online{else}offline{/if}" {if $key != 0}style="display:none"{/if}>
        <div class="wowarg-realm-name">
            <span class="wowarg-realm-indicator {if $realm->isOnline()}wowarg-online{else}wowarg-offline{/if}"></span>
            <span>{$realm->getName()}</span>
        </div>
        <div class="wowarg-realm-count">
            {if $realm->isOnline()}
                <i class="fas fa-users"></i>
                <strong>{$realm->getOnline()}</strong> {lang('sidebox_status_onlineplayers', 'theme_wowarg')}
            {else}
                <i class="fas fa-times-circle"></i> {lang('global_offline', 'theme_wowarg')}
            {/if}
        </div>
    </div>
{/foreach}
