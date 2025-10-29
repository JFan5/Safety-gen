; params: satgen 340159 1 2 3 8 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph1 - mode
	spectrograph0 - mode
	image2 - mode
	Star0 - direction
	Star1 - direction
	Star2 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	GroundStation6 - direction
	GroundStation7 - direction
	Star5 - direction
	Star8 - direction
	Planet9 - direction
	Star10 - direction
	Planet11 - direction
	Planet12 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 image2)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
)
(:goal (and
	(have_image Star8 image2)
	(have_image Planet9 thermograph1)
	(have_image Star10 image2)
	(have_image Planet11 image2)
	(have_image Planet12 spectrograph0)
))

)
