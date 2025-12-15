(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_08 obj_07 - type_1
obj_04 obj_09 obj_11 obj_05 - type_3
obj_12 obj_13 obj_10 obj_02 - type_2
obj_03 obj_01 obj_06 - object)
(:init
(pred_3 obj_08 obj_02)
(pred_4 obj_08 obj_04)
(pred_4 obj_08 obj_09)
(pred_3 obj_07 obj_13)
(pred_4 obj_07 obj_11)
(pred_4 obj_07 obj_05)
(pred_2 obj_03 obj_13)
(pred_2 obj_01 obj_10)
(pred_2 obj_06 obj_12)
)
(:goal
(and
(pred_2 obj_03 obj_02)
(pred_2 obj_01 obj_02)
(pred_2 obj_06 obj_13)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_08 obj_02) (pred_3 obj_07 obj_02))))
  )
)
)