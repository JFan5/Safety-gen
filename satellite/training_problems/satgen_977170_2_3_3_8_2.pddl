; params: satgen 977170 2 3 3 8 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	instrument4 - instrument
	instrument5 - instrument
	spectrograph1 - mode
	thermograph0 - mode
	image2 - mode
	GroundStation1 - direction
	Star2 - direction
	GroundStation5 - direction
	GroundStation3 - direction
	GroundStation6 - direction
	GroundStation7 - direction
	GroundStation4 - direction
	GroundStation0 - direction
	Planet8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 image2)
	(calibration_target instrument0 GroundStation6)
	(supports instrument1 spectrograph1)
	(supports instrument1 thermograph0)
	(supports instrument1 image2)
	(calibration_target instrument1 GroundStation5)
	(calibration_target instrument1 GroundStation3)
	(supports instrument2 spectrograph1)
	(calibration_target instrument2 GroundStation3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
	(supports instrument3 thermograph0)
	(supports instrument3 spectrograph1)
	(supports instrument3 image2)
	(calibration_target instrument3 GroundStation0)
	(supports instrument4 thermograph0)
	(supports instrument4 image2)
	(calibration_target instrument4 GroundStation7)
	(calibration_target instrument4 GroundStation6)
	(supports instrument5 spectrograph1)
	(calibration_target instrument5 GroundStation0)
	(calibration_target instrument5 GroundStation4)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(on_board instrument5 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet8)
)
(:goal (and
	(have_image Planet8 spectrograph1)
	(have_image Phenomenon9 image2)
))

)
