; params: satgen 98591 2 3 4 7 3
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
	thermograph2 - mode
	thermograph0 - mode
	spectrograph1 - mode
	thermograph3 - mode
	Star4 - direction
	Star6 - direction
	GroundStation5 - direction
	Star0 - direction
	Star1 - direction
	GroundStation3 - direction
	Star2 - direction
	Planet7 - direction
	Planet8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 thermograph0)
	(supports instrument0 thermograph3)
	(calibration_target instrument0 Star0)
	(calibration_target instrument0 GroundStation5)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 Star2)
	(supports instrument2 thermograph0)
	(calibration_target instrument2 Star0)
	(calibration_target instrument2 GroundStation5)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet7)
	(supports instrument3 thermograph3)
	(supports instrument3 thermograph2)
	(supports instrument3 thermograph0)
	(calibration_target instrument3 GroundStation3)
	(calibration_target instrument3 Star1)
	(supports instrument4 thermograph2)
	(supports instrument4 spectrograph1)
	(supports instrument4 thermograph0)
	(calibration_target instrument4 Star2)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star6)
)
(:goal (and
	(pointing satellite0 GroundStation3)
	(have_image Planet7 thermograph0)
	(have_image Planet8 spectrograph1)
	(have_image Phenomenon9 thermograph0)
))

)
