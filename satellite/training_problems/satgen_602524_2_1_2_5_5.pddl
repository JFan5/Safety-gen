; params: satgen 602524 2 1 2 5 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image0 - mode
	spectrograph1 - mode
	GroundStation1 - direction
	Star2 - direction
	Star3 - direction
	GroundStation0 - direction
	Star4 - direction
	Star5 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Planet8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
	(supports instrument1 spectrograph1)
	(supports instrument1 image0)
	(calibration_target instrument1 Star4)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation1)
)
(:goal (and
	(pointing satellite0 GroundStation1)
	(have_image Star5 spectrograph1)
	(have_image Planet6 image0)
	(have_image Phenomenon7 image0)
	(have_image Planet8 image0)
	(have_image Phenomenon9 image0)
))

)
