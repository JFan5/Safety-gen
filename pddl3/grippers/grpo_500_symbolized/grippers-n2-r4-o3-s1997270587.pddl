(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_01 - type_1
obj_04 obj_07 obj_05 obj_13 - type_3
obj_02 obj_11 obj_09 obj_03 - type_2
obj_06 obj_08 obj_12 - object)
(:init
(pred_4 obj_10 obj_03)
(pred_2 obj_10 obj_04)
(pred_2 obj_10 obj_07)
(pred_4 obj_01 obj_09)
(pred_2 obj_01 obj_05)
(pred_2 obj_01 obj_13)
(pred_3 obj_06 obj_02)
(pred_3 obj_08 obj_11)
(pred_3 obj_12 obj_11)
)
(:goal
(and
(pred_3 obj_06 obj_03)
(pred_3 obj_08 obj_11)
(pred_3 obj_12 obj_02)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_10 obj_02) (pred_4 obj_01 obj_02))))
  )
)
)