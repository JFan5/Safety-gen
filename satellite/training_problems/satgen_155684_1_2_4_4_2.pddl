; params: satgen 155684 1 2 4 4 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	image2 - mode
	thermograph0 - mode
	thermograph1 - mode
	spectrograph3 - mode
	GroundStation0 - direction
	Star3 - direction
	Star2 - direction
	Star1 - direction
	Planet4 - direction
	Star5 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph3)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star2)
	(supports instrument1 spectrograph3)
	(supports instrument1 image2)
	(calibration_target instrument1 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
)
(:goal (and
	(have_image Planet4 thermograph0)
	(have_image Star5 spectrograph3)
))

)
