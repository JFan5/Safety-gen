; params: satgen 29996 1 3 3 5 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	thermograph0 - mode
	spectrograph1 - mode
	infrared2 - mode
	Star1 - direction
	Star3 - direction
	Star2 - direction
	Star0 - direction
	Star4 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star2)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 Star0)
	(supports instrument2 infrared2)
	(supports instrument2 thermograph0)
	(calibration_target instrument2 Star4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon6)
)
(:goal (and
	(have_image Phenomenon5 thermograph0)
	(have_image Phenomenon6 thermograph0)
	(have_image Phenomenon7 infrared2)
	(have_image Phenomenon8 infrared2)
	(have_image Phenomenon9 infrared2)
))

)
