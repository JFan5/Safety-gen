; params: satgen 383293 1 2 3 8 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph2 - mode
	spectrograph1 - mode
	thermograph0 - mode
	GroundStation1 - direction
	Star3 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	GroundStation6 - direction
	Star7 - direction
	Star0 - direction
	GroundStation2 - direction
	Star8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
	Phenomenon11 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 spectrograph1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation2)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation6)
)
(:goal (and
	(have_image Star8 thermograph0)
	(have_image Phenomenon9 thermograph0)
	(have_image Phenomenon10 thermograph2)
	(have_image Phenomenon11 thermograph2)
))

)
