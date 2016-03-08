/*
 * This is part of pipes.wl/usepipes.wl, an "Underhalls" tribute
 * I started in around 2006 and never finished.
 *                                                 -- jmtd
 */
#"pickups.h"
#"monsters.h"
#"spawns.h"
#"standard.h"

#"pipes.wl"
#"boring.wl"

usepipes {
  slimeinit(0, 128, 120)

  -- control sectors can extend from here
  pushpop(
    move(-64) rotright
    slimeinit_once
  )

  /*
   * beginning rooms; preamble to pipes
   */
  pushpop( movestep(64,64) thing )
                    room(32,add(32,128),160,256,256)
  movestep(0,128)   door(32,add(32,72),160)
  movestep(0,-128)  room(32,128,136,128,384)
  move(256)         room(32,128,136,128,384)
  !oppositeentrance
  movestep(0,128)   bigdoor(32,add(32,72),160)
  movestep(0,-320)  
  

  rotleft quad( right(768) ) rotright
  twice(
		room(-512,256,160,256,256)
		move(256)
		room(-512,256,160,256,256)
		movestep(-768,512)
  )
  movestep(256,-256)
	straight(128)
  leftsector(32,256,160)

  ^oppositeentrance
  move(-128)
  rotright

  /*
   * now for the pipe tunnels
   */
  move(add(-32,-256))

  /*
   * unreachable detailing to the left
   */
  !beginning_detail_left
  turnaround movestep(0,-256)
  impassable
  slimebars(0)
  slimesplit(
    slimebarcurve(0,120),

    slime_downpipe,

    slimebars(0)
    slimefade
    twice( slimecurve_l )
  )


  impassable
  ^beginning_detail_left
  water_carriage_return

  slimeopening(928) -- TODO: a less random figure
  slimeswitch(128,1)
  slimebars(1)
  pushpop( movestep(128,-128) rotleft slimechoke )
  slimecurve_l

  move(32)
  slimesecret(256,doublebarreled thing)
  water_carriage_return

  slimecorridor(896)
  -- monsters for the upper corridor
  pushpop(
    movestep(-256,128)
    turnaround
    demon deaf
    triple( thing move(128) )
    deaf
  )

  pushpop(movestep(-128,64) player1start thing)
  _slimequad(
    !east,
    /*west*/ slimebars(0) slimefade _slimecurve_r(get("slimefloor"), get("slimeceil"), 0),
    -256, get("slimeceil"),get("slimelight")
  )
  /*north*/ slimebars(0) slimefade _slimecurve(get("slimefloor"), get("slimeceil"), 0)
  ^east
  slimecorridor(128)

}
