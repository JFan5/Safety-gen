(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_08 - type_1
obj_04 obj_02 obj_01 obj_06 - type_3
obj_05 obj_09 obj_07 obj_03 - type_2
obj_11 obj_13 obj_12 - object)
(:init
(pred_4 obj_10 obj_07)
(pred_2 obj_10 obj_04)
(pred_2 obj_10 obj_02)
(pred_4 obj_08 obj_03)
(pred_2 obj_08 obj_01)
(pred_2 obj_08 obj_06)
(pred_3 obj_11 obj_07)
(pred_3 obj_13 obj_03)
(pred_3 obj_12 obj_05)
)
(:goal
(and
(pred_3 obj_11 obj_05)
(pred_3 obj_13 obj_09)
(pred_3 obj_12 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_10 obj_09) (pred_4 obj_08 obj_09))))
  )
)
)