; params: satgen 819004 2 3 4 6 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	image2 - mode
	thermograph3 - mode
	spectrograph1 - mode
	image0 - mode
	Star2 - direction
	GroundStation3 - direction
	GroundStation5 - direction
	Star1 - direction
	Star0 - direction
	Star4 - direction
	Phenomenon6 - direction
	Planet7 - direction
	Phenomenon8 - direction
	Star9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 image0)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon6)
	(supports instrument1 spectrograph1)
	(supports instrument1 image2)
	(calibration_target instrument1 Star0)
	(supports instrument2 spectrograph1)
	(supports instrument2 thermograph3)
	(supports instrument2 image2)
	(calibration_target instrument2 Star4)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation3)
)
(:goal (and
	(pointing satellite0 Star2)
	(have_image Phenomenon6 thermograph3)
	(have_image Planet7 image2)
	(have_image Phenomenon8 image0)
	(have_image Star9 image2)
	(have_image Planet10 image2)
))

)
