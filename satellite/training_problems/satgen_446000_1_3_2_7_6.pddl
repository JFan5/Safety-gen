; params: satgen 446000 1 3 2 7 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	spectrograph1 - mode
	image0 - mode
	Star2 - direction
	Star3 - direction
	Star6 - direction
	GroundStation0 - direction
	Star4 - direction
	GroundStation5 - direction
	GroundStation1 - direction
	Phenomenon7 - direction
	Star8 - direction
	Star9 - direction
	Star10 - direction
	Phenomenon11 - direction
	Planet12 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 GroundStation0)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 Star4)
	(calibration_target instrument1 GroundStation1)
	(supports instrument2 spectrograph1)
	(supports instrument2 image0)
	(calibration_target instrument2 GroundStation1)
	(calibration_target instrument2 GroundStation5)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star8)
)
(:goal (and
	(pointing satellite0 Planet12)
	(have_image Phenomenon7 spectrograph1)
	(have_image Star8 image0)
	(have_image Star9 image0)
	(have_image Star10 image0)
	(have_image Phenomenon11 spectrograph1)
	(have_image Planet12 image0)
))

)
