; params: satgen 388347 1 2 3 6 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph0 - mode
	thermograph2 - mode
	infrared1 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	Star3 - direction
	Star4 - direction
	Star5 - direction
	GroundStation1 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 infrared1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
)
(:goal (and
	(pointing satellite0 Phenomenon6)
	(have_image Phenomenon6 thermograph2)
	(have_image Phenomenon7 infrared1)
))

)
