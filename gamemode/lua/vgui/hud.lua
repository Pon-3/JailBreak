hud = { };
 
local function clr( color ) return color.r, color.g, color.b, color.a; end
 
function hud:PaintBar( x, y, w, h, colors, value )
 
	self:PaintPanel( x, y, w, h, colors );
 
	x = x + 1; y = y + 1;
	w = w - 2; h = h - 2;
 
	local width = w * math.Clamp( value, 0, 1 );
	local shade = 4;
 
	surface.SetDrawColor( clr( colors.shade ) );
	surface.DrawRect( x, y, width, shade );
 
	surface.SetDrawColor( clr( colors.fill ) );
	surface.DrawRect( x, y + shade, width, h - shade );
 
end
 
function hud:PaintPanel( x, y, w, h, colors )
 
	surface.SetDrawColor( clr( colors.border ) );
	surface.DrawOutlinedRect( x, y, w, h );
 
	x = x + 1; y = y + 1;
	w = w - 2; h = h - 2;
 
	surface.SetDrawColor( clr( colors.background ) );
	surface.DrawRect( x, y, w, h );
 
end
 
function hud:PaintText( x, y, text, font, colors )
 
	surface.SetFont( font );
 
	surface.SetTextPos( x + 1, y + 1 );
	surface.SetTextColor( clr( colors.shadow ) );
	surface.DrawText( text );
 
	surface.SetTextPos( x, y );
	surface.SetTextColor( clr( colors.text ) );
	surface.DrawText( text );
 
end

 
function hud:TextSize( text, font )
 
	surface.SetFont( font );
	return surface.GetTextSize( text );
 
end
 
/*--------------------------------------------------------------------
Start HUD Painting
--------------------------------------------------------------------*/

local vars =
{ 
 
	font = "TargetID",
 
	padding = 10,
	margin = 35,
 
	text_spacing = 2,
	bar_spacing = 5,
 
	bar_height = 16,
 
	width = 0.25
};
 
local colors =
{ 
 
	background =
	{
 
		border = Color( 0, 0, 0, 255 ),
		background = Color( 115, 115, 115, 10 )
 
	},
 
	text =
	{
 
		shadow = Color( 0, 0, 0, 200 ),
		text = Color( 222, 222, 222, 255 )
 
	},
 
	health_bar =
	{
 
		border = Color( 255, 0, 0, 255 ),
		background = Color( 255, 0, 0, 75 ),
		shade = Color( 255, 104, 104, 255 ),
		fill = Color( 232, 0, 0, 255 )
 
	},
 
	armor_bar =
	{
 
		border = Color( 0, 0, 255, 255 ),
		background = Color( 0, 47, 255, 75 ),
		shade = Color( 136, 136, 255, 255 ),
		fill = Color( 0, 47, 255, 255 )
 
	}
 
};
 
function HUDPaint( )
  
	client = client or LocalPlayer( );				-- set a shortcut to the client
	if( !client:Alive( ) ) then return; end				-- don't draw if the client is dead
 
	local _, th = good_hud:TextSize( "TEXT", vars.font );		-- get text size( height in this case )
 
	local i = 2;							-- shortcut to how many items( bars + text ) we have
 
	local width = vars.width * ScrW( );				-- calculate width
	local bar_width = width - ( vars.padding * i );			-- calculate bar width and element height
	local height = ( vars.padding * i ) + ( th * i ) + ( vars.text_spacing * i ) + ( vars.bar_height * i ) + vars.bar_spacing;
 
	local x = vars.margin;						-- get x position of element
	local y = ScrH( ) - vars.margin - height;			-- get y position of element
 
	local cx = x + vars.padding;					-- get x and y of contents
	local cy = y + vars.padding;
 
	good_hud:PaintPanel( x, y, width, height, colors.background );	-- paint the background panel
 
	local by = th + vars.text_spacing;				-- calc text position
 
	local text = string.format( "Health: %iHP", client:Health( ) );	-- get health text
	good_hud:PaintText( cx, cy, text, vars.font, colors.text );	-- paint health text and health bar
	good_hud:PaintBar( cx, cy + by, bar_width, vars.bar_height, colors.health_bar, client:Health( ) / 100 );
 
	by = by + vars.bar_height + vars.bar_spacing;			-- increment text position
 
	local text = string.format( "Armor: %iSP", client:Armor( ) );	-- get suit text
	good_hud:PaintText( cx, cy + by, text, vars.font, colors.text );	-- paint suit text and suit bar
	good_hud:PaintBar( cx, cy + by + th + vars.text_spacing, bar_width, vars.bar_height, colors.armor_bar, client:Armor( ) / 100 );
 
end
hook.Add( "HUDPaint", "PaintOurHud", HUDPaint )

function hidehud(name)
	for k, v in pairs({"CHudHealth", "CHudBattery"})do
		if name == v then return false end
	end
end
hook.Add("HUDShouldDraw", "HideOurHud", hidehud)