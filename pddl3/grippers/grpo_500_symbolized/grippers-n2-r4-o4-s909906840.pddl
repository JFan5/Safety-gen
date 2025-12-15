(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_13 - type_1
obj_02 obj_07 obj_14 obj_10 - type_3
obj_04 obj_05 obj_09 obj_11 - type_2
obj_08 obj_01 obj_06 obj_12 - object)
(:init
(pred_3 obj_03 obj_05)
(pred_4 obj_03 obj_02)
(pred_4 obj_03 obj_07)
(pred_3 obj_13 obj_09)
(pred_4 obj_13 obj_14)
(pred_4 obj_13 obj_10)
(pred_2 obj_08 obj_05)
(pred_2 obj_01 obj_05)
(pred_2 obj_06 obj_09)
(pred_2 obj_12 obj_11)
)
(:goal
(and
(pred_2 obj_08 obj_05)
(pred_2 obj_01 obj_05)
(pred_2 obj_06 obj_05)
(pred_2 obj_12 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_03 obj_05) (pred_3 obj_13 obj_05))))
  )
)
)