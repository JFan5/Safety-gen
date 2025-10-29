; params: satgen 573004 2 2 2 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	thermograph0 - mode
	spectrograph1 - mode
	Star0 - direction
	Star1 - direction
	GroundStation2 - direction
	Star6 - direction
	Star7 - direction
	Star4 - direction
	GroundStation5 - direction
	GroundStation3 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star4)
	(calibration_target instrument0 Star7)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet8)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation5)
	(supports instrument2 thermograph0)
	(supports instrument2 spectrograph1)
	(calibration_target instrument2 GroundStation3)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation3)
)
(:goal (and
	(pointing satellite0 Star4)
	(pointing satellite1 Star7)
	(have_image Planet8 thermograph0)
	(have_image Phenomenon9 thermograph0)
	(have_image Planet10 thermograph0)
))

)
