; params: satgen 433463 2 2 3 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared1 - mode
	thermograph0 - mode
	spectrograph2 - mode
	Star0 - direction
	Star3 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	Star4 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 infrared1)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star4)
)
(:goal (and
	(pointing satellite1 Phenomenon6)
	(have_image Star4 infrared1)
	(have_image Phenomenon5 thermograph0)
	(have_image Phenomenon6 spectrograph2)
	(have_image Planet7 infrared1)
))

)
