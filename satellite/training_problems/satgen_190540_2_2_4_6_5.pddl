; params: satgen 190540 2 2 4 6 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	thermograph1 - mode
	image3 - mode
	spectrograph0 - mode
	infrared2 - mode
	Star1 - direction
	Star0 - direction
	Star5 - direction
	Star2 - direction
	GroundStation4 - direction
	Star3 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
	Planet9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star0)
	(calibration_target instrument0 GroundStation4)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 Star2)
	(calibration_target instrument1 Star5)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon7)
	(supports instrument2 infrared2)
	(supports instrument2 image3)
	(supports instrument2 spectrograph0)
	(calibration_target instrument2 GroundStation4)
	(supports instrument3 spectrograph0)
	(supports instrument3 image3)
	(calibration_target instrument3 Star3)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star3)
)
(:goal (and
	(have_image Phenomenon6 spectrograph0)
	(have_image Phenomenon7 infrared2)
	(have_image Phenomenon8 infrared2)
	(have_image Planet9 spectrograph0)
	(have_image Phenomenon10 thermograph1)
))

)
