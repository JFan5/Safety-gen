; params: satgen 570669 2 1 4 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image1 - mode
	image3 - mode
	spectrograph0 - mode
	thermograph2 - mode
	GroundStation0 - direction
	Star3 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	Star4 - direction
	Planet5 - direction
	Star6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 image1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation1)
	(supports instrument1 thermograph2)
	(supports instrument1 image1)
	(supports instrument1 image3)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon7)
)
(:goal (and
	(pointing satellite0 Star6)
	(pointing satellite1 GroundStation1)
	(have_image Star4 image1)
	(have_image Planet5 image3)
	(have_image Star6 spectrograph0)
	(have_image Phenomenon7 image1)
))

)
