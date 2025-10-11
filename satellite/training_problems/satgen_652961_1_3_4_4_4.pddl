; params: satgen 652961 1 3 4 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	spectrograph3 - mode
	image0 - mode
	thermograph2 - mode
	image1 - mode
	GroundStation3 - direction
	Star0 - direction
	Star2 - direction
	GroundStation1 - direction
	Star4 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 image0)
	(calibration_target instrument0 Star0)
	(supports instrument1 image1)
	(calibration_target instrument1 Star2)
	(supports instrument2 thermograph2)
	(supports instrument2 image1)
	(supports instrument2 spectrograph3)
	(calibration_target instrument2 GroundStation1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation3)
)
(:goal (and
	(pointing satellite0 Phenomenon6)
	(have_image Star4 spectrograph3)
	(have_image Planet5 image0)
	(have_image Phenomenon6 thermograph2)
	(have_image Planet7 thermograph2)
))

)
