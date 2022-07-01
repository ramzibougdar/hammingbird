{*
* 2007-2019 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2018 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{* Use this if you want to send php var to your js *}

{literal}
<script type="text/javascript">
    var pssocialconnect_frontController = "{/literal}{$frontController|escape:'htmlall':'UTF-8'}{literal}";
    var pssocialconnect_style_class = "{/literal}{$socialconnect_params.PSSOCIALCONNECT_STYLE|escape:'htmlall':'UTF-8'}{literal}";
    var pssocialconnect_style_rounding = "{/literal}{$socialconnect_params.PSSOCIALCONNECT_ROUNDING|escape:'htmlall':'UTF-8'}{literal}";
    var pssocialconnect_style_align = "{/literal}{$socialconnect_params.PSSOCIALCONNECT_ALIGN|escape:'htmlall':'UTF-8'}{literal}";
    var pssocialconnect_style_hovering = "{/literal}{$socialconnect_params.PSSOCIALCONNECT_HOVERSTATE|escape:'htmlall':'UTF-8'}{literal}";
    var pssocialconnect_amazon_api_key = "{/literal}{$socialconnect_params.PSSOCIALCONNECT_AMAZON_API_KEY|escape:'htmlall':'UTF-8'}{literal}";
    var pssocialconnect_facebook_api_key = "{/literal}{$socialconnect_params.PSSOCIALCONNECT_FACEBOOK_API_KEY|escape:'htmlall':'UTF-8'}{literal}";
    var pssocialconnect_google_api_key = "{/literal}{$socialconnect_params.PSSOCIALCONNECT_GOOGLE_API_KEY|escape:'htmlall':'UTF-8'}{literal}";
    var pssocialconnect_paypal_api_key = "{/literal}{$socialconnect_params.PSSOCIALCONNECT_PAYPAL_API_KEY|escape:'htmlall':'UTF-8'}{literal}";
    var pssocialconnect_paypal_url = "{/literal}{$socialconnect_params.PSSOCIALCONNECT_PAYPAL_URL|escape:'htmlall':'UTF-8'}{literal}";
</script>
{/literal}
<div class="megasocialconnect">
    <div class="row row-cols-1">
        <div class="col">
            <div class="pssocialconnect-row">
                {if $socialconnect_params.PSSOCIALCONNECT_FACEBOOK_SWITCH eq 1 && !empty($socialconnect_params.PSSOCIALCONNECT_FACEBOOK_API_KEY)}
                    {* facebook button *}
                    {include file="module:pssocialconnect/views/templates/hook/ps_socialconnect_facebook_button.tpl"}
                {/if}
            </div>
        </div>
        <div class="col">
            <div class="pssocialconnect-row">
                {if $socialconnect_params.PSSOCIALCONNECT_GOOGLE_SWITCH eq 1 && !empty($socialconnect_params.PSSOCIALCONNECT_GOOGLE_API_KEY)}
                    {* google button *}
                    {include file="module:pssocialconnect/views/templates/hook/ps_socialconnect_google_button.tpl"}
                {/if}
            </div>
        </div>

    </div>

    <div class="pssocialconnect-row minirow">
        {if $socialconnect_params.PSSOCIALCONNECT_AMAZON_SWITCH eq 1 && !empty($socialconnect_params.PSSOCIALCONNECT_AMAZON_API_KEY)}
            <span id="pssocialconnect_amazon_content">
            {* amazon button *}
                {include file="module:pssocialconnect/views/templates/hook/ps_socialconnect_amazon_button.tpl"}
        </span>
        {/if}

        {if $socialconnect_params.PSSOCIALCONNECT_PAYPAL_SWITCH eq 1 && !empty($socialconnect_params.PSSOCIALCONNECT_PAYPAL_API_KEY)}
            <span id="pssocialconnect_paypal_content">
            {* paypal button *}
                {include file="module:pssocialconnect/views/templates/hook/ps_socialconnect_paypal_button.tpl"}
        </span>
        {/if}

        {if $socialconnect_params.PSSOCIALCONNECT_LINKEDIN_SWITCH eq 1 && !empty($socialconnect_params.PSSOCIALCONNECT_LINKEDIN_API_KEY)}
            <span id="pssocialconnect_linkedin_content">
            {* linkedin button *}
                {include file="module:pssocialconnect/views/templates/hook/ps_socialconnect_linkedin_button.tpl"}
        </span>
        {/if}

    </div>
</div>


<style>
    .pssocialconnectButton.outline {
        border-radius: {$socialconnect_params.PSSOCIALCONNECT_ROUNDING|escape:'html':'UTF-8'}px;
    }

    .pssocialconnectButton {
        border-radius: {$socialconnect_params.PSSOCIALCONNECT_ROUNDING|escape:'html':'UTF-8'}px !important;
    }
</style>