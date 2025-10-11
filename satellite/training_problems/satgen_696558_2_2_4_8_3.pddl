; params: satgen 696558 2 2 4 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	thermograph3 - mode
	thermograph2 - mode
	spectrograph1 - mode
	spectrograph0 - mode
	GroundStation0 - direction
	Star3 - direction
	Star4 - direction
	GroundStation6 - direction
	GroundStation7 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	Star5 - direction
	Star8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 thermograph3)
	(supports instrument0 spectrograph1)
	(supports instrument0 thermograph2)
	(calibration_target instrument0 Star5)
	(calibration_target instrument0 GroundStation7)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 GroundStation1)
	(supports instrument2 thermograph3)
	(supports instrument2 spectrograph0)
	(calibration_target instrument2 Star5)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation1)
)
(:goal (and
	(have_image Star8 thermograph2)
	(have_image Phenomenon9 spectrograph1)
	(have_image Phenomenon10 spectrograph0)
))

)
