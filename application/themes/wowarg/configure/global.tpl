{strip}

{$moduleName = $CI->router->fetch_module()}

{* ───── Sidebar modules ───────────────────────────────── *}
{$sidebox_modules = array('news')}

{* ───── Social links ──────────────────────────────────── *}
{$social['discord']['enabled'] = true}
{$social['discord']['link']    = "https://discord.gg/wowarg"}
{$social['facebook']['enabled'] = false}
{$social['facebook']['link']    = "https://facebook.com"}
{$social['twitter']['enabled'] = false}
{$social['twitter']['link']    = "https://twitter.com"}
{$social['youtube']['enabled'] = false}
{$social['youtube']['link']    = "https://youtube.com"}
{$social['instagram']['enabled'] = false}
{$social['instagram']['link']   = "https://instagram.com"}

{* ───── Footer ───────────────────────────────────────── *}
{$footer['since'] = "2024"}
{$footer['text']  = "WoW Argentina es un servidor privado gratuito de World of Warcraft: Wrath of the Lich King impulsado por AzerothCore. World of Warcraft y Blizzard Entertainment son marcas registradas de Blizzard Entertainment, Inc."}

{* ───── Realm descriptions ───────────────────────────── *}
{$realm_desc[1] = "WotLK 3.3.5a &times; x1 &mdash; Fun"}

{/strip}
