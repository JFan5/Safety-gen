(define (problem BW-rand-5)
(:domain blocksworld)
(:objects obj_01 obj_04 obj_05 obj_02 obj_03 )
(:init
(pred_3)
(pred_4 obj_01 obj_02)
(pred_4 obj_04 obj_05)
(pred_4 obj_05 obj_03)
(pred_1 obj_02)
(pred_1 obj_03)
(pred_5 obj_01)
(pred_5 obj_04)
)
(:goal
(and
(pred_4 obj_01 obj_05)
(pred_4 obj_04 obj_03)
(pred_4 obj_05 obj_04)
(pred_1 obj_02)
(pred_1 obj_03))
)

(:constraints
  (sometime-before (pred_4 obj_04 obj_03) (pred_4 obj_01 obj_05))
)
)