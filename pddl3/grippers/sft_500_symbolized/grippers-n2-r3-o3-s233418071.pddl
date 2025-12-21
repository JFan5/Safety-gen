(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_10 obj_03 - type_1
obj_08 obj_04 obj_12 obj_07 - type_2
obj_11 obj_06 obj_02 - type_3
obj_01 obj_09 obj_05 - object)
(:init
(pred_1 obj_10 obj_02)
(pred_3 obj_10 obj_08)
(pred_3 obj_10 obj_04)
(pred_1 obj_03 obj_11)
(pred_3 obj_03 obj_12)
(pred_3 obj_03 obj_07)
(pred_2 obj_01 obj_02)
(pred_2 obj_09 obj_11)
(pred_2 obj_05 obj_06)
)
(:goal
(and
(pred_2 obj_01 obj_11)
(pred_2 obj_09 obj_02)
(pred_2 obj_05 obj_06)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_10 obj_02) (pred_1 obj_03 obj_02))))
  )
)
)