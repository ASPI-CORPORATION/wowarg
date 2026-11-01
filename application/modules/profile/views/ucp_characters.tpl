{if $characters > 0}
	<div class="section-header">Profile <span>Characters</span></div>
	<div class="section-body">
	
		{foreach from=$realms item=realm}
			{if $realm->getCharacterCount($id) > 0}
            <div class="table-responsive text-nowrap">
				<table class="nice_table mb-3">
					<thead>
						<tr>
							<th scope="col" colspan="6" class="h4 text-center">{$realm->getName()}</th>
						</tr>
					</thead>
					<tbody>
						{foreach from=$realm->getCharacters()->getCharactersByAccount($id) item=character}
							<tr>
								<td class="col-1">
									<img src="{$url}application/images/stats/{$character.race}-{$character.gender}.gif">
								</td>
								<td class="col-2">
									<img src="{$url}application/images/stats/{$character.class}.gif" width="20px">
								</td>
								{if hasPermission("viewCharInfos", "profile")}
									{$money = $realmsObj->formatMoney($character.money)}
									<td class="col-3">{$character.name}</td>

									
									<td class="col-4 user-points">
										{if $money}
											<span class="moneygold">{$money["gold"]}</span>
											<span class="moneysilver">{$money["silver"]}</span>
											<span class="moneycopper">{$money["copper"]}</span>
										{else}
											<span class="moneycopper">0</span>
										{/if}
									</td>
								{else}
									<td class="col-5">{$character.name}</td>
								{/if}

								<td>Lv{$character.level}</td>
								<td class="col-6"><a href="{$url}character/{$realm->getId()}/{$character.guid}">{lang("view_character", "ucp")}</a></td>
							</tr>
						{/foreach}
					</tbody>
				</table>
            </div>
			{/if}
		{/foreach}

	</div>
{/if}
