<table class="wowarg-pvp-table">
    {if $characters}
        <thead>
            <tr>
                <th class="wowarg-pvp-num">#</th>
                <th class="wowarg-pvp-name">{lang('sidebox_pvp_charname', 'theme_wowarg')}</th>
                <th class="wowarg-pvp-class">{lang('sidebox_pvp_charclass', 'theme_wowarg')}</th>
                <th class="wowarg-pvp-kills">{lang('sidebox_pvp_charkills', 'theme_wowarg')}</th>
            </tr>
        </thead>
        <tbody>
            {foreach from=$characters key=key item=character}
                <tr class="{if $key == 0}wowarg-pvp-first{/if} {if (($key + 1) %2) == 0}even{else}odd{/if}">
                    <td class="wowarg-pvp-num">
                        {if $key == 0}<i class="fas fa-crown wowarg-text-gold"></i>{else}{$key + 1}{/if}
                    </td>
                    <td class="wowarg-pvp-name">
                        <a href="{$url}character/{$realm}/{$character.guid}">{$character.name}</a>
                    </td>
                    <td class="wowarg-pvp-class color-c{$character.class}">{$CI->realms->getClass($character.class)}</td>
                    <td class="wowarg-pvp-kills">
                        <span class="wowarg-kills-count">{$character.totalKills}</span>
                    </td>
                </tr>
            {/foreach}
        </tbody>
    {else}
        <tbody>
            <tr>
                <td colspan="4" class="wowarg-pvp-empty">{lang('no_stats', 'sidebox_toppvp')}</td>
            </tr>
        </tbody>
    {/if}
</table>
