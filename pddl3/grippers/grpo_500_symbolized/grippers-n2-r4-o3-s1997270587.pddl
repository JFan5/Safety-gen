(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_13 - type_1
obj_01 obj_05 obj_04 obj_10 - type_3
obj_09 obj_02 obj_06 obj_12 - type_2
obj_08 obj_07 obj_03 - object)
(:init
(pred_3 obj_11 obj_12)
(pred_4 obj_11 obj_01)
(pred_4 obj_11 obj_05)
(pred_3 obj_13 obj_06)
(pred_4 obj_13 obj_04)
(pred_4 obj_13 obj_10)
(pred_2 obj_08 obj_09)
(pred_2 obj_07 obj_02)
(pred_2 obj_03 obj_02)
)
(:goal
(and
(pred_2 obj_08 obj_12)
(pred_2 obj_07 obj_02)
(pred_2 obj_03 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_11 obj_09) (pred_3 obj_13 obj_09))))
  )
)
)