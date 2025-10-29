; params: satgen 258269 1 3 4 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared1 - mode
	spectrograph2 - mode
	image3 - mode
	thermograph0 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation0 - direction
	Planet4 - direction
	Star5 - direction
	Star6 - direction
	Phenomenon7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(supports instrument0 thermograph0)
	(supports instrument0 image3)
	(supports instrument0 infrared1)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
)
(:goal (and
	(have_image Planet4 thermograph0)
	(have_image Star5 image3)
	(have_image Star6 image3)
	(have_image Phenomenon7 infrared1)
	(have_image Planet8 thermograph0)
))

)
