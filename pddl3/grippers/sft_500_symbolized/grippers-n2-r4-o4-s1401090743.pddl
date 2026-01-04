(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_11 - type_3
obj_03 obj_12 obj_02 obj_05 - type_1
obj_01 obj_04 obj_14 obj_09 - type_2
obj_10 obj_07 obj_13 obj_06 - object)
(:init
(pred_3 obj_08 obj_04)
(pred_4 obj_08 obj_03)
(pred_4 obj_08 obj_12)
(pred_3 obj_11 obj_01)
(pred_4 obj_11 obj_02)
(pred_4 obj_11 obj_05)
(pred_1 obj_10 obj_04)
(pred_1 obj_07 obj_04)
(pred_1 obj_13 obj_04)
(pred_1 obj_06 obj_01)
)
(:goal
(and
(pred_1 obj_10 obj_09)
(pred_1 obj_07 obj_14)
(pred_1 obj_13 obj_04)
(pred_1 obj_06 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_08 obj_09) (pred_3 obj_11 obj_09))))
  )
)
)