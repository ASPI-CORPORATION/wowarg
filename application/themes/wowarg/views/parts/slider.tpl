<!-- Slider.Start -->
<section id="slider_bg" class="wowarg-slider" aria-label="Slider principal">
    <div class="wowarg-slider-track" id="slider">
        {foreach from=$slider key=key item=slide}
            <div class="wowarg-slide {if $slide@first}active{/if}"
                 {if isset($slide.image) && $slide.image && $slide.image != $image_path}
                     style="background-image:url('{$slide.image}')"
                 {/if}>
                <div class="wowarg-slide-overlay"></div>
                {if $slide.header || $slide.body || $slide.footer}
                    <div class="wowarg-slide-caption">
                        <div class="wowarg-slide-caption-inner">
                            {if $slide.header}<h2 class="wowarg-slide-title">{$slide.header}</h2>{/if}
                            {if $slide.body}<p class="wowarg-slide-body">{$slide.body}</p>{/if}
                            {if $slide.footer}<div class="wowarg-slide-footer">{$slide.footer}</div>{/if}
                        </div>
                    </div>
                {/if}
            </div>
        {/foreach}
    </div>

    {if count($slider) > 1}
        <div class="wowarg-slider-dots" id="slider_buttons" aria-label="Navegaci&oacute;n del slider">
            {foreach from=$slider key=key item=slide}
                <button class="wowarg-slider-dot {if $slide@first}active{/if}" data-index="{$key}" aria-label="Slide {$key+1}"></button>
            {/foreach}
        </div>
        <button class="wowarg-slider-arrow wowarg-slider-prev" id="slider-prev" aria-label="Anterior">
            <i class="fas fa-chevron-left"></i>
        </button>
        <button class="wowarg-slider-arrow wowarg-slider-next" id="slider-next" aria-label="Siguiente">
            <i class="fas fa-chevron-right"></i>
        </button>
    {/if}
</section>
<!-- Slider.End -->
