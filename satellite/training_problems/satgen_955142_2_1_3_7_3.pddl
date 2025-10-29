; params: satgen 955142 2 1 3 7 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph0 - mode
	image1 - mode
	spectrograph2 - mode
	Star0 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	Star6 - direction
	GroundStation5 - direction
	GroundStation1 - direction
	Phenomenon7 - direction
	Planet8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph2)
	(calibration_target instrument0 Star6)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation5)
	(supports instrument1 spectrograph2)
	(supports instrument1 image1)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 GroundStation1)
	(calibration_target instrument1 GroundStation5)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon7)
)
(:goal (and
	(pointing satellite0 Star6)
	(pointing satellite1 GroundStation5)
	(have_image Phenomenon7 image1)
	(have_image Planet8 image1)
	(have_image Planet9 image1)
))

)
