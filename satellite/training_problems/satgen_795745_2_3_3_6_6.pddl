; params: satgen 795745 2 3 3 6 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	infrared2 - mode
	image0 - mode
	thermograph1 - mode
	GroundStation0 - direction
	GroundStation3 - direction
	Star4 - direction
	Star2 - direction
	Star5 - direction
	Star1 - direction
	Planet6 - direction
	Star7 - direction
	Phenomenon8 - direction
	Planet9 - direction
	Phenomenon10 - direction
	Phenomenon11 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 infrared2)
	(calibration_target instrument0 Star1)
	(supports instrument1 infrared2)
	(supports instrument1 thermograph1)
	(supports instrument1 image0)
	(calibration_target instrument1 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
	(supports instrument2 thermograph1)
	(supports instrument2 infrared2)
	(supports instrument2 image0)
	(calibration_target instrument2 Star1)
	(calibration_target instrument2 Star5)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet6)
)
(:goal (and
	(pointing satellite1 Star5)
	(have_image Planet6 image0)
	(have_image Star7 image0)
	(have_image Phenomenon8 image0)
	(have_image Planet9 image0)
	(have_image Phenomenon10 thermograph1)
	(have_image Phenomenon11 image0)
))

)
