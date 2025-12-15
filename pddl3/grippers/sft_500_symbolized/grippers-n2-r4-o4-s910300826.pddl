(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_02 - type_2
obj_04 obj_03 obj_08 obj_01 - type_3
obj_05 obj_09 obj_12 obj_11 - type_1
obj_14 obj_06 obj_07 obj_13 - object)
(:init
(pred_4 obj_10 obj_09)
(pred_2 obj_10 obj_04)
(pred_2 obj_10 obj_03)
(pred_4 obj_02 obj_05)
(pred_2 obj_02 obj_08)
(pred_2 obj_02 obj_01)
(pred_1 obj_14 obj_12)
(pred_1 obj_06 obj_12)
(pred_1 obj_07 obj_09)
(pred_1 obj_13 obj_05)
)
(:goal
(and
(pred_1 obj_14 obj_12)
(pred_1 obj_06 obj_09)
(pred_1 obj_07 obj_12)
(pred_1 obj_13 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_10 obj_09) (pred_4 obj_02 obj_09))))
  )
)
)