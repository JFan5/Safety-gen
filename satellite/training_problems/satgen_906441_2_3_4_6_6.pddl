; params: satgen 906441 2 3 4 6 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	spectrograph0 - mode
	infrared3 - mode
	thermograph1 - mode
	thermograph2 - mode
	Star0 - direction
	GroundStation1 - direction
	Star3 - direction
	Star2 - direction
	Star5 - direction
	Star4 - direction
	Planet6 - direction
	Planet7 - direction
	Phenomenon8 - direction
	Star9 - direction
	Phenomenon10 - direction
	Planet11 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star2)
	(calibration_target instrument0 Star4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
	(supports instrument1 thermograph2)
	(calibration_target instrument1 Star5)
	(supports instrument2 spectrograph0)
	(supports instrument2 infrared3)
	(calibration_target instrument2 Star4)
	(calibration_target instrument2 Star5)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star9)
)
(:goal (and
	(pointing satellite0 Star4)
	(pointing satellite1 Phenomenon8)
	(have_image Planet6 spectrograph0)
	(have_image Planet7 thermograph2)
	(have_image Phenomenon8 spectrograph0)
	(have_image Star9 thermograph1)
	(have_image Phenomenon10 thermograph2)
	(have_image Planet11 infrared3)
))

)
