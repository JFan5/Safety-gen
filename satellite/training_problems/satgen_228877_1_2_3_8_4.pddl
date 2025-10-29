; params: satgen 228877 1 2 3 8 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared1 - mode
	spectrograph2 - mode
	thermograph0 - mode
	Star0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star4 - direction
	Star6 - direction
	GroundStation7 - direction
	Star5 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
	Planet10 - direction
	Star11 - direction
)
(:init
	(supports instrument0 spectrograph2)
	(supports instrument0 thermograph0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
)
(:goal (and
	(pointing satellite0 Star4)
	(have_image Phenomenon8 thermograph0)
	(have_image Phenomenon9 thermograph0)
	(have_image Planet10 spectrograph2)
	(have_image Star11 infrared1)
))

)
