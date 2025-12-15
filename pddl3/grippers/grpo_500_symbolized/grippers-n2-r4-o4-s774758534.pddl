(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_10 - type_1
obj_11 obj_04 obj_14 obj_07 - type_3
obj_02 obj_06 obj_13 obj_05 - type_2
obj_01 obj_03 obj_08 obj_09 - object)
(:init
(pred_3 obj_12 obj_05)
(pred_4 obj_12 obj_11)
(pred_4 obj_12 obj_04)
(pred_3 obj_10 obj_06)
(pred_4 obj_10 obj_14)
(pred_4 obj_10 obj_07)
(pred_2 obj_01 obj_02)
(pred_2 obj_03 obj_02)
(pred_2 obj_08 obj_02)
(pred_2 obj_09 obj_06)
)
(:goal
(and
(pred_2 obj_01 obj_05)
(pred_2 obj_03 obj_02)
(pred_2 obj_08 obj_06)
(pred_2 obj_09 obj_06)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_12 obj_06) (pred_3 obj_10 obj_06))))
  )
)
)