{*
* 2007-2019 PrestaShop
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
* @author    PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2018 PrestaShop SA
* @license   http://addons.prestashop.com/en/content/12-terms-and-conditions-of-use
* International Registered Trademark & Property of PrestaShop SA
*}

{capture name=path}
    <a href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}">
        {l s='My account' mod='pssocialconnect'}
    </a>
    <span class="navigation-pipe">></span>
    <span class="navigation_page">{l s='My linked accounts' mod='pssocialconnect'}</span>
{/capture}

{literal}
<script type="text/javascript">
    var pssocialconnect_idCustomerLinking = "{/literal}{$idCustomerLinking|escape:'htmlall':'UTF-8'}{literal}";
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
<div class="container">
    <section class="page_content">
    {if $socialconnect_params.PSSOCIALCONNECT_FACEBOOK_SWITCH eq 1}
    {* Facebook *}
    <div class="socialconnect-facebook row">

        <div class="socialconnect-facebook-left col-xs-9 col-md-10 col-lg-10">
            <div class="socialconnect-facebook-logo">
                <img style="float: left; margin-right: 20px; height: auto; max-height: 48px; width: auto; max-width: 42px;" src={$module_dir}pssocialconnect/views/img/facebook_logo.png>
            </div>
            <div class="socialconnect-facebook-text">
                <label class="socialmedia-name">Facebook</label>
                {if $facebookLink eq 1}
                <div class="connected-as">{l s='Connected as' mod='pssocialconnect'} {$facebookAccountLinked.firstname_linked} {$facebookAccountLinked.lastname_linked}</div>
                {else}
                    <div class="no-account-linked">{l s='No Account Linked' mod='pssocialconnect'}</div>
                {/if}
            </div>
        </div>

        <div class="socialconnect-facebook-right col-xs-3 col-md-2 col-lg-2">
            {include file="{$pssc_path}/views/templates/front/Buttons/ps_socialconnect_facebook_button.tpl"}
        </div>

    </div>
    <hr>
    {/if}
    {if $socialconnect_params.PSSOCIALCONNECT_GOOGLE_SWITCH eq 1}
    {* Google *}
    <div class="socialconnect-google row">

        <div class="socialconnect-google-left col-xs-9 col-md-10 col-lg-10">
            <div class="socialconnect-google-logo">
                <img style="float: left; margin-right: 20px; height: auto; max-height: 48px; width: auto; max-width: 42px;" src={$module_dir}pssocialconnect/views/img/google_logo.png>
            </div>
            <div class="socialconnect-google-text">
            <label class="socialmedia-name">Google</label>
                {if $googleLink eq 1}
                <div class="connected-as">{l s='Connected as' mod='pssocialconnect'} {$googleAccountLinked.firstname_linked} {$googleAccountLinked.lastname_linked}</div>
                {else}
                    <div class="no-account-linked">{l s='No Account Linked' mod='pssocialconnect'}</div>
                {/if}
            </div>
        </div>

        <div class="socialconnect-google-right col-xs-3 col-md-2 col-lg-2">
            {include file="{$pssc_path}/views/templates/front/Buttons/ps_socialconnect_google_button.tpl"}
        </div>
    </div>
    <hr>
    {/if}
    {if $socialconnect_params.PSSOCIALCONNECT_AMAZON_SWITCH eq 1}
    {* Amazon *}
    <div class="socialconnect-amazon row">

        <div class="socialconnect-amazon-left col-xs-9 col-md-10 col-lg-10">
            <div class="socialconnect-amazon-logo">
                <img style="float: left; margin-right: 20px; height: auto; max-height: 48px; width: auto; max-width: 42px;" src={$module_dir}pssocialconnect/views/img/amazon_logo.png>
            </div>
            <div class="socialconnect-amazon-text">
            <label class="socialmedia-name">Amazon</label>
                {if $amazonLink eq 1}
                <div class="connected-as">{l s='Connected as' mod='pssocialconnect'} {$amazonAccountLinked.firstname_linked} {$amazonAccountLinked.lastname_linked}</div>
                {else}
                    <div class="no-account-linked">{l s='No Account Linked' mod='pssocialconnect'}</div>
                {/if}
            </div>
        </div>
    
        <div class="socialconnect-amazon-right col-xs-3 col-md-2 col-lg-2">
            {include file="{$pssc_path}/views/templates/front/Buttons/ps_socialconnect_amazon_button.tpl"}
        </div>
            
    </div>
    <hr>
    {/if}
    {if $socialconnect_params.PSSOCIALCONNECT_PAYPAL_SWITCH eq 1}
    {* PayPal *}
    <div class="socialconnect-paypal row">
        <div class="socialconnect-paypal-left col-xs-9 col-md-10 col-lg-10">
            <div class="socialconnect-paypal-logo">
                <img style="float: left; margin-right: 20px; height: auto; max-height: 48px; width: auto; max-width: 42px;" src={$module_dir}pssocialconnect/views/img/paypal_logo.png>
            </div>
            <div class="socialconnect-paypal-text">
            <label class="socialmedia-name">PayPal</label>
                {if $paypalLink eq 1}
                <div class="connected-as">{l s='Connected as' mod='pssocialconnect'} {$paypalAccountLinked.firstname_linked} {$paypalAccountLinked.lastname_linked}</div>
                {else}
                    <div class="no-account-linked">{l s='No Account Linked' mod='pssocialconnect'}</div>
                {/if}
            </div>
        </div>
        
        <div class="socialconnect-paypal-right col-xs-3 col-md-2 col-lg-2">
            {include file="{$pssc_path}/views/templates/front/Buttons/ps_socialconnect_paypal_button.tpl"}
        </div>
                
    </div>
    <hr>
    {/if}
    {if $socialconnect_params.PSSOCIALCONNECT_LINKEDIN_SWITCH eq 1}
    {* LinkedIn *}
    <div class="socialconnect-linkedin row">
        <div class="socialconnect-linkedin-left col-xs-9 col-md-10 col-lg-10">
            <div class="socialconnect-linkedin-logo">
                <img style="float: left; margin-right: 20px; height: auto; max-height: 48px; width: auto; max-width: 42px;" src={$module_dir}pssocialconnect/views/img/linkedin_logo.png>
            </div>
            <div class="socialconnect-linkedin-text">
            <label class="socialmedia-name">LinkedIn</label>
                {if $linkedinLink eq 1}
                <div class="connected-as">{l s='Connected as' mod='pssocialconnect'} {$linkedinAccountLinked.firstname_linked} {$linkedinAccountLinked.lastname_linked}</div>
                {else}
                    <div class="no-account-linked">{l s='No Account Linked' mod='pssocialconnect'}</div>
                {/if}
            </div>
        </div>
            
        <div class="socialconnect-linkedin-right col-xs-3 col-md-2 col-lg-2">
            {include file="{$pssc_path}/views/templates/front/Buttons/ps_socialconnect_linkedin_button.tpl"}
        </div>
            
    </div>
    <hr>
    {/if}
    {if !$socialconnect_params.PSSOCIALCONNECT_FACEBOOK_SWITCH && !$socialconnect_params.PSSOCIALCONNECT_GOOGLE_SWITCH && !$socialconnect_params.PSSOCIALCONNECT_AMAZON_SWITCH && !$socialconnect_params.PSSOCIALCONNECT_PAYPAL_SWITCH && !$socialconnect_params.PSSOCIALCONNECT_LINKEDIN_SWITCH eq 1}
        {l s='No Social Network Configured, contact the shop owner' mod='pssocialconnect'}
    {/if}
    </section>
</div>
<style>
.socialmedia-name {
    height: 19px;
    color: rgba(0,0,0,0.8);
    font-size: 14px;
    font-weight: 600;
    line-height: 19px;
}
.connected-as {
    height: 17px;
    color: rgba(0,0,0,0.8);
    font-size: 12px;
    font-style: italic;
    line-height: 17px;
}
.no-account-linked {
    height: 17px !important;
    opacity: 0.5 !important;
    color: rgba(0,0,0,0.8) !important;
    font-size: 12px !important;
    font-style: italic !important;
    line-height: 17px !important;
}
</style>