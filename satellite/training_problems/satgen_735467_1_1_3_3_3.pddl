; params: satgen 735467 1 1 3 3 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph0 - mode
	spectrograph2 - mode
	infrared1 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	Star0 - direction
	Phenomenon3 - direction
	Star4 - direction
	Planet5 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 spectrograph2)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
)
(:goal (and
	(pointing satellite0 GroundStation2)
	(have_image Phenomenon3 spectrograph2)
	(have_image Star4 infrared1)
	(have_image Planet5 infrared1)
))

)
