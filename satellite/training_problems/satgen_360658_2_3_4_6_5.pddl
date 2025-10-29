; params: satgen 360658 2 3 4 6 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	thermograph0 - mode
	image2 - mode
	infrared3 - mode
	spectrograph1 - mode
	Star1 - direction
	GroundStation2 - direction
	Star4 - direction
	Star3 - direction
	GroundStation0 - direction
	Star5 - direction
	Planet6 - direction
	Planet7 - direction
	Star8 - direction
	Planet9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph1)
	(supports instrument0 image2)
	(supports instrument0 infrared3)
	(calibration_target instrument0 GroundStation0)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
	(supports instrument1 image2)
	(calibration_target instrument1 GroundStation0)
	(supports instrument2 spectrograph1)
	(supports instrument2 thermograph0)
	(supports instrument2 image2)
	(calibration_target instrument2 Star5)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star1)
)
(:goal (and
	(pointing satellite1 GroundStation0)
	(have_image Planet6 image2)
	(have_image Planet7 image2)
	(have_image Star8 image2)
	(have_image Planet9 thermograph0)
	(have_image Star10 thermograph0)
))

)
