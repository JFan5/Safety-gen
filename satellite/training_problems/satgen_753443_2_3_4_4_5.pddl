; params: satgen 753443 2 3 4 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	thermograph1 - mode
	image2 - mode
	spectrograph0 - mode
	spectrograph3 - mode
	GroundStation2 - direction
	GroundStation0 - direction
	GroundStation1 - direction
	GroundStation3 - direction
	Phenomenon4 - direction
	Star5 - direction
	Star6 - direction
	Star7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 spectrograph3)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
	(supports instrument1 spectrograph3)
	(supports instrument1 thermograph1)
	(supports instrument1 image2)
	(calibration_target instrument1 GroundStation1)
	(supports instrument2 spectrograph0)
	(supports instrument2 spectrograph3)
	(supports instrument2 thermograph1)
	(calibration_target instrument2 GroundStation3)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star5)
)
(:goal (and
	(pointing satellite0 GroundStation3)
	(pointing satellite1 Star7)
	(have_image Phenomenon4 image2)
	(have_image Star5 spectrograph3)
	(have_image Star6 image2)
	(have_image Star7 thermograph1)
	(have_image Star8 spectrograph0)
))

)
