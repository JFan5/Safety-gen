; params: satgen 842951 2 3 4 5 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	infrared1 - mode
	image2 - mode
	spectrograph0 - mode
	image3 - mode
	Star2 - direction
	Star3 - direction
	GroundStation1 - direction
	GroundStation0 - direction
	Star4 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Planet7 - direction
	Star8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation1)
	(supports instrument1 spectrograph0)
	(supports instrument1 infrared1)
	(supports instrument1 image2)
	(calibration_target instrument1 Star4)
	(supports instrument2 spectrograph0)
	(calibration_target instrument2 GroundStation0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
	(supports instrument3 image3)
	(supports instrument3 spectrograph0)
	(calibration_target instrument3 Star4)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star8)
)
(:goal (and
	(have_image Phenomenon5 infrared1)
	(have_image Planet6 spectrograph0)
	(have_image Planet7 spectrograph0)
	(have_image Star8 infrared1)
	(have_image Star9 image3)
))

)
