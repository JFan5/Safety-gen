; params: satgen 555227 2 2 4 5 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	spectrograph0 - mode
	thermograph2 - mode
	infrared3 - mode
	image1 - mode
	GroundStation0 - direction
	Star2 - direction
	Star3 - direction
	GroundStation1 - direction
	Star4 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Star7 - direction
	Planet8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 thermograph2)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet5)
	(supports instrument1 spectrograph0)
	(supports instrument1 thermograph2)
	(supports instrument1 image1)
	(calibration_target instrument1 GroundStation1)
	(supports instrument2 thermograph2)
	(supports instrument2 spectrograph0)
	(supports instrument2 infrared3)
	(calibration_target instrument2 Star4)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star7)
)
(:goal (and
	(pointing satellite1 Planet5)
	(have_image Planet5 spectrograph0)
	(have_image Phenomenon6 infrared3)
	(have_image Star7 thermograph2)
	(have_image Planet8 image1)
	(have_image Phenomenon9 image1)
))

)
