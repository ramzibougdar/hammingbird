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
<script>
window.addEventListener('DOMContentLoaded', function() {
    if (typeof prestashop !== "undefined") {
        {if $page.page_name == 'checkout'}
            $( ".tab-content" ).prepend( $( ".megasocialconnect" ) );        
        {/if}
        {if $page.page_name == 'identity'}
            $(".megasocialconnect").hide();
        {/if}
        {if $page.page_name == 'authentication'}
            $( "#customer-form" ).prepend( $( ".megasocialconnect" ) );        
        {/if}
    }
    else {
        
    }
});
</script>
{literal}
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<div class="megasocialconnect">
{* {$page.page_name|@var_dump} *}
{* needed by amazon and paypal, needs to be on top of their div *}
  <div>
    <div id="amazon-root"></div>
    <div id='cwppButton'></div>
</div>

<div class="row pssocialconnect-row minirow">
{if !empty($socialconnect_params.PSSOCIALCONNECT_FACEBOOK_API_KEY) || !empty($socialconnect_params.PSSOCIALCONNECT_GOOGLE_API_KEY) || !empty($socialconnect_params.PSSOCIALCONNECT_AMAZON_API_KEY) || !empty($socialconnect_params.PSSOCIALCONNECT_PAYPAL_API_KEY) || !empty($socialconnect_params.PSSOCIALCONNECT_LINKEDIN_API_KEY)}    
<label class="continue-with-pssocialconnect">
    {l s='Continue with an existing account on' mod='pssocialconnect'}
</label>
<br>
{/if}

    {if $socialconnect_params.PSSOCIALCONNECT_FACEBOOK_SWITCH eq 1 && !empty($socialconnect_params.PSSOCIALCONNECT_FACEBOOK_API_KEY)}
        <span id="pssocialconnect_facebook_content">
        {* facebook button *}
        {block name='ps_socialconnect_facebook_block'}
        {include file='module:pssocialconnect/views/templates/hook/checkout/ps_socialconnect_facebook_button.tpl'}
        {/block}
        </span>
    {/if}

    {if $socialconnect_params.PSSOCIALCONNECT_GOOGLE_SWITCH eq 1 && !empty($socialconnect_params.PSSOCIALCONNECT_GOOGLE_API_KEY)}
        <span id="pssocialconnect_google_content">
        {* google button *}
        {block name='ps_socialconnect_google_block'}
        {include file='module:pssocialconnect/views/templates/hook/checkout/ps_socialconnect_google_button.tpl'}
        {/block}
        </span>
    {/if}

    {if $socialconnect_params.PSSOCIALCONNECT_AMAZON_SWITCH eq 1 && !empty($socialconnect_params.PSSOCIALCONNECT_AMAZON_API_KEY)}
        <span id="pssocialconnect_amazon_content">
            {* amazon button *}
            {block name='ps_socialconnect_amazon_block'}
            {include file='module:pssocialconnect/views/templates/hook/checkout/ps_socialconnect_amazon_button.tpl'}
            {/block}
        </span>
    {/if}

    {if $socialconnect_params.PSSOCIALCONNECT_PAYPAL_SWITCH eq 1 && !empty($socialconnect_params.PSSOCIALCONNECT_PAYPAL_API_KEY)}
        <span id="pssocialconnect_paypal_content">
            {* paypal button *}
            {block name='ps_socialconnect_paypal_block'}
            {include file='module:pssocialconnect/views/templates/hook/checkout/ps_socialconnect_paypal_button.tpl'}
            {/block}
        </span>
    {/if}

    {if $socialconnect_params.PSSOCIALCONNECT_LINKEDIN_SWITCH eq 1 && !empty($socialconnect_params.PSSOCIALCONNECT_LINKEDIN_API_KEY)}
        <span id="pssocialconnect_linkedin_content">
            {* linkedin button *}
            {block name='ps_socialconnect_linkedin_block'}
            {include file='module:pssocialconnect/views/templates/hook/checkout/ps_socialconnect_linkedin_button.tpl'}
            {/block}
        </span>
    {/if}

</div>
{if !empty($socialconnect_params.PSSOCIALCONNECT_FACEBOOK_API_KEY) || !empty($socialconnect_params.PSSOCIALCONNECT_GOOGLE_API_KEY) || !empty($socialconnect_params.PSSOCIALCONNECT_AMAZON_API_KEY) || !empty($socialconnect_params.PSSOCIALCONNECT_PAYPAL_API_KEY) || !empty($socialconnect_params.PSSOCIALCONNECT_LINKEDIN_API_KEY)}
<br>
<div align="left">
<label class="pssocialconnect-or">
    {l s='or' mod='pssocialconnect'}
<label>
</div>
{/if}
</div>

<style>
.continue-with-pssocialconnect {
    font-size: 14px;
    font-weight: bold;
    line-height: 19px;
}
.pssocialconnect-or {
    font-size: 18px;
    font-weight: bold;
    text-transform: lowercase;
    margin-left: 10px;
}
.pssocialconnect-row {
    text-align: left;
    margin-left: 5px;
}
  .fab {
    margin-right: 2px;
  }
  /* Plain Button */
.pssocialconnectButton {
    cursor: pointer !important;
    color: #FFFFFF !important;
    font-weight: 600 !important;
    font-size: 16px !important;
    height: 44px !important;
    width: 250px !important;
    border: 1px solid!important;
    border-radius: {$socialconnect_params.PSSOCIALCONNECT_ROUNDING|escape:'html':'UTF-8'}px !important;
    transition: transform .25s, color .15s
        ease-in-out,background-color .15s
        ease-in-out,border-color .15s
        ease-in-out,box-shadow .15s
        ease-in-out !important;
}
/* Mini Button */
.pssocialconnectButton.mini {
    height: 40px !important;
    width: 40px !important;
    margin-right: 10px !important;
}
.pssocialconnectButton.mini > .pssocialconnect-label {
    display: none !important;
}
/* Background Color (for all buttons */
.pssocialconnectButton.facebook-button {
    background-color: #3B5998
}
.pssocialconnectButton.google-button {
    background-color: #EA4335
}
.pssocialconnectButton.linkedin-button {
    background-color: #0077b5
}
.pssocialconnectButton.paypal-button {
    background-color: #179BD7
}
.pssocialconnectButton.amazon-button {
    background-color: #FF9900
}
/* Outline Button */
.pssocialconnectButton.outline {
    border-color: #979797 !important;
    color: #FFFFFF !important;
    border-radius: {$socialconnect_params.PSSOCIALCONNECT_ROUNDING|escape:'html':'UTF-8'}px !important;
    background-color: transparent;
}
.pssocialconnectButton.outline.facebook-button {
    color: #3B5998 !important;
}
.pssocialconnectButton.outline.google-button {
    color: #EA4335 !important;
}
.pssocialconnectButton.outline.linkedin-button {
    color: #0077b5 !important;
}
.pssocialconnectButton.outline.paypal-button {
    color: #179BD7 !important;
}
.pssocialconnectButton.outline.amazon-button {
    color: #FF9900 !important;
}
/* FULL INVERT */
.pssocialconnectButton.invert:hover {
    border: 1px solid #979797 !important;
    background-color: transparent;
}
.pssocialconnectButton.facebook-button.invert:hover {
    color: #3B5998 !important;
    border-color: #3B5998 !important;
}
.pssocialconnectButton.google-button.invert:hover {
    color: #EA4335 !important;
    border-color: #EA4335 !important;
}
.pssocialconnectButton.linkedin-button.invert:hover {
    color: #0077b5 !important;
    border-color: #0077b5 !important;
}
.pssocialconnectButton.paypal-button.invert:hover {
    color: #179BD7 !important;
    border-color: #179BD7 !important;
}
.pssocialconnectButton.amazon-button.invert:hover {
    color: #FF9900 !important;
    border-color: #FF9900 !important;
}
/* OUTLINE INVERT */
.pssocialconnectButton.outline.invert:hover {
    color: #FFFFFF !important;
}
.pssocialconnectButton.outline.facebook-button.invert:hover {
    background-color: #3B5998 !important;
    border-color: #3B5998 !important;
}
.pssocialconnectButton.outline.google-button.invert:hover {
    background-color: #EA4335 !important;
    border-color: #EA4335 !important;
}
.pssocialconnectButton.outline.linkedin-button.invert:hover {
    background-color: #0077b5 !important;
    border-color: #0077b5 !important;
}
.pssocialconnectButton.outline.paypal-button.invert:hover {
    background-color: #179BD7 !important;
    border-color: #179BD7 !important;
}
.pssocialconnectButton.outline.amazon-button.invert:hover {
    background-color: #FF9900 !important;
    border-color: #FF9900 !important;
}
/* OUTLINE SHADOW BG */
.pssocialconnectButton.outline.shadow:hover {
    box-shadow: 0 2px 8px 0 rgba(0,0,0,0.2);
    transform: translateY(-2px);
}
/* OUTLINE FILL SHADOW */
.pssocialconnectButton.outline.fill:hover {
    background-color: rgba(0,0,0,0.06);
}
/* FULL SHADOW BG */
.pssocialconnectButton.shadow:hover {
    box-shadow: 0 2px 8px 0 rgba(0,0,0,0.2);
    transform: translateY(-2px);
}
/* FULL FILL SHADOW */
.pssocialconnectButton.fill:hover {
    background-color: rgba(0,0,0,0.06);
    color: #535252 !important;
}
.pssocialconnectButton.left.mini {
  .fab {
    padding-left: 2px !important;
  }
  text-align: center;
}
</style>