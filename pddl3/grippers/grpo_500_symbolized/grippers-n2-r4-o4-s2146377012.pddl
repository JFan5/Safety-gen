(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_07 - type_1
obj_14 obj_12 obj_02 obj_13 - type_3
obj_05 obj_04 obj_06 obj_09 - type_2
obj_11 obj_01 obj_03 obj_10 - object)
(:init
(pred_4 obj_08 obj_09)
(pred_2 obj_08 obj_14)
(pred_2 obj_08 obj_12)
(pred_4 obj_07 obj_04)
(pred_2 obj_07 obj_02)
(pred_2 obj_07 obj_13)
(pred_3 obj_11 obj_05)
(pred_3 obj_01 obj_06)
(pred_3 obj_03 obj_09)
(pred_3 obj_10 obj_06)
)
(:goal
(and
(pred_3 obj_11 obj_05)
(pred_3 obj_01 obj_06)
(pred_3 obj_03 obj_06)
(pred_3 obj_10 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_08 obj_06) (pred_4 obj_07 obj_06))))
  )
)
)