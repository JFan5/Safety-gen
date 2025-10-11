; params: satgen 993845 2 2 2 5 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	spectrograph1 - mode
	thermograph0 - mode
	GroundStation0 - direction
	GroundStation4 - direction
	GroundStation2 - direction
	Star1 - direction
	Star3 - direction
	Planet5 - direction
	Planet6 - direction
	Star7 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 thermograph0)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon9)
	(supports instrument2 thermograph0)
	(calibration_target instrument2 Star3)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet8)
)
(:goal (and
	(pointing satellite1 Planet5)
	(have_image Planet5 spectrograph1)
	(have_image Planet6 spectrograph1)
	(have_image Star7 spectrograph1)
	(have_image Planet8 thermograph0)
	(have_image Phenomenon9 spectrograph1)
	(have_image Planet10 thermograph0)
))

)
