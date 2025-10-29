; params: satgen 507956 1 1 4 3 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image1 - mode
	spectrograph0 - mode
	thermograph2 - mode
	thermograph3 - mode
	Star1 - direction
	Star2 - direction
	Star0 - direction
	Planet3 - direction
	Star4 - direction
	Star5 - direction
	Star6 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 spectrograph0)
	(supports instrument0 thermograph3)
	(supports instrument0 image1)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
)
(:goal (and
	(have_image Planet3 image1)
	(have_image Star4 image1)
	(have_image Star5 thermograph3)
	(have_image Star6 thermograph2)
))

)
