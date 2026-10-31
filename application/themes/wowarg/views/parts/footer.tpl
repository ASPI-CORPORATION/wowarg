<!-- Footer.Start -->
<footer id="footer" class="wowarg-footer">
    <div class="wowarg-footer-main">
        <div class="container-fluid">
            <div class="row g-4">

                <!-- Brand + Socials -->
                <div class="col-lg-4 col-md-12">
                    <div class="wowarg-footer-brand">
                        <div class="wowarg-footer-logo">
                            <i class="fas fa-dragon"></i>
                            <span>WoW Argentina</span>
                        </div>
                        <p class="wowarg-footer-desc">{$footer['text']}</p>
                        <div class="wowarg-footer-socials">
                            {if $social['discord']['enabled']}
                                <a href="{$social['discord']['link']}" target="_blank" rel="noopener noreferrer" class="wowarg-footer-social-link" title="Discord"><i class="fab fa-discord"></i></a>
                            {/if}
                            {if $social['facebook']['enabled']}
                                <a href="{$social['facebook']['link']}" target="_blank" rel="noopener noreferrer" class="wowarg-footer-social-link" title="Facebook"><i class="fab fa-facebook-f"></i></a>
                            {/if}
                            {if $social['twitter']['enabled']}
                                <a href="{$social['twitter']['link']}" target="_blank" rel="noopener noreferrer" class="wowarg-footer-social-link" title="Twitter / X"><i class="fab fa-x-twitter"></i></a>
                            {/if}
                            {if $social['youtube']['enabled']}
                                <a href="{$social['youtube']['link']}" target="_blank" rel="noopener noreferrer" class="wowarg-footer-social-link" title="YouTube"><i class="fab fa-youtube"></i></a>
                            {/if}
                            {if $social['instagram']['enabled']}
                                <a href="{$social['instagram']['link']}" target="_blank" rel="noopener noreferrer" class="wowarg-footer-social-link" title="Instagram"><i class="fab fa-instagram"></i></a>
                            {/if}
                        </div>
                    </div>
                </div>

                <!-- Navigation -->
                <div class="col-lg-4 col-md-6">
                    <div class="wowarg-footer-nav">
                        <h4 class="wowarg-footer-col-title"><i class="fas fa-compass"></i> Navegaci&oacute;n</h4>
                        <ul class="wowarg-footer-nav-list">
                            {foreach from=$menu_bottom item=foot_nav}
                                <li>
                                    <a {$foot_nav.link} class="wowarg-footer-nav-link {if $foot_nav.active}active{/if}" title="{$foot_nav.name}">
                                        <i class="fas fa-chevron-right"></i> {$foot_nav.name}
                                    </a>
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                </div>

                <!-- Connection guide -->
                <div class="col-lg-4 col-md-6">
                    <div class="wowarg-footer-connect">
                        <h4 class="wowarg-footer-col-title"><i class="fas fa-plug"></i> C&oacute;mo Conectarse</h4>
                        <ol class="wowarg-footer-steps">
                            <li>
                                <strong>Descarg&aacute; el cliente WoW 3.3.5a</strong>
                            </li>
                            <li>
                                <strong>Edit&aacute; el realmlist:</strong>
                                <code class="wowarg-realmlist-code">set realmlist wowarg.com</code>
                            </li>
                            <li>
                                <strong><a href="{$url}register" class="wowarg-footer-reg-link" data-hasevent="1">Registrate gratis</a> y comenz&aacute; a jugar</strong>
                            </li>
                        </ol>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="wowarg-footer-bottom">
        <div class="container-fluid">
            <div class="wowarg-footer-bottom-inner">
                <p class="wowarg-footer-legal">World of Warcraft&copy; y Blizzard Entertainment&copy; son marcas registradas de Blizzard Entertainment, Inc. Este sitio no est&aacute; afiliado ni respaldado por Blizzard Entertainment&copy;.</p>
                <div class="wowarg-footer-copy">
                    <span>Copyright &copy; <strong>{$serverName}</strong> {$footer['since']}&ndash;{"Y"|date}</span>
                    <span class="wowarg-footer-sep">&bull;</span>
                    <span>Impulsado por <a href="https://www.azerothcore.org" target="_blank" rel="noopener noreferrer">AzerothCore</a></span>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Footer.End -->
