; params: satgen 547166 2 2 4 8 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	spectrograph2 - mode
	spectrograph0 - mode
	image1 - mode
	thermograph3 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation5 - direction
	GroundStation7 - direction
	Star1 - direction
	Star6 - direction
	GroundStation4 - direction
	Star8 - direction
	Star9 - direction
	Star10 - direction
	Star11 - direction
	Planet12 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 spectrograph0)
	(supports instrument0 spectrograph2)
	(supports instrument0 thermograph3)
	(calibration_target instrument0 Star1)
	(supports instrument1 image1)
	(supports instrument1 spectrograph0)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 Star6)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star8)
	(supports instrument2 spectrograph2)
	(supports instrument2 image1)
	(calibration_target instrument2 GroundStation4)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star10)
)
(:goal (and
	(pointing satellite0 Star11)
	(have_image Star8 image1)
	(have_image Star9 thermograph3)
	(have_image Star10 spectrograph2)
	(have_image Star11 spectrograph0)
	(have_image Planet12 thermograph3)
))

)
