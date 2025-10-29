; params: satgen 708091 2 2 2 7 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	spectrograph1 - mode
	thermograph0 - mode
	GroundStation1 - direction
	Star2 - direction
	Star3 - direction
	Star4 - direction
	Star5 - direction
	Star0 - direction
	GroundStation6 - direction
	Star7 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
	Star11 - direction
	Planet12 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
	(supports instrument1 thermograph0)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 Star0)
	(supports instrument2 spectrograph1)
	(supports instrument2 thermograph0)
	(calibration_target instrument2 GroundStation6)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon10)
)
(:goal (and
	(pointing satellite1 Star11)
	(have_image Star7 thermograph0)
	(have_image Phenomenon8 spectrograph1)
	(have_image Phenomenon9 thermograph0)
	(have_image Phenomenon10 spectrograph1)
	(have_image Star11 spectrograph1)
	(have_image Planet12 spectrograph1)
))

)
