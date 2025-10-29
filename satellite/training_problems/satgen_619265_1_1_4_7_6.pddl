; params: satgen 619265 1 1 4 7 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	thermograph1 - mode
	infrared2 - mode
	spectrograph3 - mode
	thermograph0 - mode
	Star0 - direction
	GroundStation1 - direction
	Star2 - direction
	GroundStation3 - direction
	Star6 - direction
	Star4 - direction
	Star5 - direction
	Planet7 - direction
	Star8 - direction
	Phenomenon9 - direction
	Star10 - direction
	Phenomenon11 - direction
	Planet12 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph3)
	(supports instrument0 thermograph1)
	(supports instrument0 infrared2)
	(calibration_target instrument0 Star5)
	(calibration_target instrument0 Star4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon11)
)
(:goal (and
	(pointing satellite0 GroundStation3)
	(have_image Planet7 infrared2)
	(have_image Star8 spectrograph3)
	(have_image Phenomenon9 thermograph1)
	(have_image Star10 thermograph0)
	(have_image Phenomenon11 spectrograph3)
	(have_image Planet12 thermograph0)
))

)
