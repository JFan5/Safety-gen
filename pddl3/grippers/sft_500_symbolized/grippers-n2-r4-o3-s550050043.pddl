(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_04 obj_10 - type_1
obj_07 obj_12 obj_13 obj_03 - type_2
obj_11 obj_01 obj_05 obj_02 - type_3
obj_08 obj_06 obj_09 - object)
(:init
(pred_1 obj_04 obj_11)
(pred_3 obj_04 obj_07)
(pred_3 obj_04 obj_12)
(pred_1 obj_10 obj_02)
(pred_3 obj_10 obj_13)
(pred_3 obj_10 obj_03)
(pred_2 obj_08 obj_05)
(pred_2 obj_06 obj_11)
(pred_2 obj_09 obj_02)
)
(:goal
(and
(pred_2 obj_08 obj_05)
(pred_2 obj_06 obj_02)
(pred_2 obj_09 obj_05)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_04 obj_02) (pred_1 obj_10 obj_02))))
  )
)
)