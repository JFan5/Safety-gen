; params: satgen 171730 2 1 4 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph1 - mode
	infrared2 - mode
	infrared3 - mode
	spectrograph0 - mode
	Star2 - direction
	Star0 - direction
	Star1 - direction
	Phenomenon3 - direction
	Planet4 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 infrared3)
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument1 spectrograph0)
	(supports instrument1 infrared3)
	(supports instrument1 infrared2)
	(calibration_target instrument1 Star1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon3)
)
(:goal (and
	(have_image Phenomenon3 infrared3)
	(have_image Planet4 spectrograph0)
	(have_image Phenomenon5 infrared2)
	(have_image Planet6 infrared2)
	(have_image Phenomenon7 spectrograph0)
	(have_image Star8 infrared3)
))

)
