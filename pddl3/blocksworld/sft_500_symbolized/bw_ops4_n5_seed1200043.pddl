(define (problem BW-rand-5)
(:domain blocksworld)
(:objects obj_02 obj_05 obj_04 obj_03 obj_01 )
(:init
(pred_4)
(pred_5 obj_02)
(pred_3 obj_05 obj_03)
(pred_3 obj_04 obj_01)
(pred_3 obj_03 obj_02)
(pred_5 obj_01)
(pred_1 obj_05)
(pred_1 obj_04)
)
(:goal
(and
(pred_3 obj_02 obj_05)
(pred_3 obj_04 obj_03)
(pred_3 obj_03 obj_01))
)

(:constraints
  (sometime-before (pred_3 obj_04 obj_03) (pred_3 obj_02 obj_05))
)
)