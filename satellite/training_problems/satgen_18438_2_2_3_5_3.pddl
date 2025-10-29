; params: satgen 18438 2 2 3 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	thermograph1 - mode
	image0 - mode
	spectrograph2 - mode
	GroundStation0 - direction
	Star1 - direction
	Star4 - direction
	Star3 - direction
	Star2 - direction
	Planet5 - direction
	Planet6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 spectrograph2)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star3)
	(supports instrument1 spectrograph2)
	(supports instrument1 image0)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 Star3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet6)
	(supports instrument2 thermograph1)
	(supports instrument2 spectrograph2)
	(supports instrument2 image0)
	(calibration_target instrument2 Star2)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star3)
)
(:goal (and
	(pointing satellite0 Planet6)
	(have_image Planet5 image0)
	(have_image Planet6 image0)
	(have_image Phenomenon7 image0)
))

)
