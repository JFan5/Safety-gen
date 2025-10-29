; params: satgen 996775 2 3 4 5 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	image3 - mode
	image0 - mode
	spectrograph1 - mode
	thermograph2 - mode
	GroundStation2 - direction
	Star3 - direction
	Star4 - direction
	GroundStation1 - direction
	GroundStation0 - direction
	Planet5 - direction
	Phenomenon6 - direction
)
(:init
	(supports instrument0 image3)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 thermograph2)
	(supports instrument1 image0)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet5)
	(supports instrument2 thermograph2)
	(supports instrument2 image0)
	(calibration_target instrument2 GroundStation0)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon6)
)
(:goal (and
	(pointing satellite1 Star4)
	(have_image Planet5 spectrograph1)
	(have_image Phenomenon6 image0)
))

)
