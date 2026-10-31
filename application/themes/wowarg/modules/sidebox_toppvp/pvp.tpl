<script type="text/javascript">
    {literal}
    var TopPvP = {
        current: 0,
        show: function(id) {
            $('#toppvp_realm_' + this.current).fadeOut(150, function() {
                TopPvP.current = id;
                $('#toppvp_realm_' + id).fadeIn(150);
            });
        }
    };
    {/literal}
    $(document).ready(function() {
        TopPvP.current = {$min_realm-1};
        $('#toppvp_realm_{$min_realm-1}').fadeIn(150);
    });
</script>

{foreach from=$realms key=key item=realm}
    <div id="toppvp_realm_{$key - 1}" class="wowarg-toppvp-realm" style="display:none">
        {if $key != $min_realm && $max_realm != 1}
            <button class="wowarg-toppvp-arrow prev" onclick="TopPvP.show(TopPvP.current - 1)" title="{lang('previous', 'sidebox_toppvp')}">
                <i class="fas fa-chevron-left"></i>
            </button>
        {/if}
        <div class="wowarg-toppvp-header">
            <span class="wowarg-toppvp-realm-name">{character_limiter($realm->getName(), 20)}</span>
        </div>
        {if $key != $max_realm}
            <button class="wowarg-toppvp-arrow next" onclick="TopPvP.show(TopPvP.current + 1)" title="{lang('next', 'sidebox_toppvp')}">
                <i class="fas fa-chevron-right"></i>
            </button>
        {/if}
        <div class="wowarg-toppvp-data">{$realm_html.$key}</div>
    </div>
{/foreach}
