{* Template for "FindExpert" custom search component. *}
{assign var="showBlock" value="'searchForm'"}
{assign var="hideBlock" value="'searchForm_show','searchForm_hide'"}

{include file="CRM/Civirules/Form/Search/RulesCriteria.tpl"}

{if $rowsEmpty}
    {include file="CRM/Contact/Form/Search/Custom/EmptyResults.tpl"}
{/if}

{if $summary}
    {$summary.summary}: {$summary.total}
{/if}

{if $rows}
    {* Search request has returned 1 or more matching rows. Display results and collapse the search criteria fieldset. *}
    {assign var="showBlock" value="'searchForm_show'"}
    {assign var="hideBlock" value="'searchForm'"}

    <fieldset>

        {* This section displays the rows along and includes the paging controls *}
        <p>

            {include file="CRM/common/pager.tpl" location="top"}

            {include file="CRM/common/pagerAToZ.tpl"}

            {strip}
        <table class="selector" summary="{ts}Search results listings.{/ts}">
            <thead class="sticky">
            {foreach from=$columnHeaders item=header}
                <th scope="col">
                    {if $header.sort}
                        {if $header.name ne "RuleID"}
                            {assign var='key' value=$header.sort}
                            {$sort->_response.$key.link}
                        {/if}
                    {else}
                        {$header.name}
                    {/if}
                </th>
            {/foreach}
            <th>&nbsp;</th>
            </thead>

            {counter start=0 skip=1 print=false}
            {foreach from=$rows item=row}
                <tr id='rowid{$row.contact_id}' class="{cycle values="odd-row,even-row"}">
                    {foreach from=$columnHeaders item=header}
                        {assign var=fName value=$header.sort}
                        {if $fName ne 'rule_id'}
                            {if $fName eq 'rule_created_date'}
                                <td>{$row.$fName|crmDate}</td>
                            {else}
                                <td>{$row.$fName}</td>
                            {/if}
                        {/if}
                    {/foreach}
                    <td><span><a href="{crmURL p='civicrm/civirule/form/rule' q="reset=1&action=update&id=`$row.rule_id`"}"
                        class="action-item action-item-first" title="Edit Rule">Edit</a></span></td>
                    {if $row.rule_is_active eq 1}
                        <td><span><a href="{crmURL p='civicrm/civirule/form/rule' q="reset=1&action=disable&id=`$row.rule_id`"}"
                            class="action-item action-item-first" title="Disable Rule">Disable</a></span></td>
                    {else}
                        <td><span><a href="{crmURL p='civicrm/civirule/form/rule' q="reset=1&action=enable&id=`$row.rule_id`"}"
                             class="action-item action-item-first" title="Enable Rule">Enable</a></span></td>
                    {/if}
                    <td><span><a href="{crmURL p='civicrm/civirule/form/rule' q="reset=1&action=delete&id=`$row.rule_id`"}"
                        class="action-item action-item-first" title="Delete Rule">Delete</a></span></td>
                </tr>
            {/foreach}
        </table>
        {/strip}

        <script type="text/javascript">
            {* this function is called to change the color of selected row(s) *}
            var fname = "{$form.formName}";
            on_load_init_checkboxes(fname);
        </script>

        {include file="CRM/common/pager.tpl" location="bottom"}

        </p>
    </fieldset>
    {* END Actions/Results section *}
{/if}



