(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_14 - type_1
obj_03 obj_08 obj_12 obj_07 - type_2
obj_01 obj_05 obj_02 obj_09 - type_3
obj_13 obj_11 obj_04 obj_06 - object)
(:init
(pred_2 obj_10 obj_02)
(pred_4 obj_10 obj_03)
(pred_4 obj_10 obj_08)
(pred_2 obj_14 obj_01)
(pred_4 obj_14 obj_12)
(pred_4 obj_14 obj_07)
(pred_1 obj_13 obj_09)
(pred_1 obj_11 obj_01)
(pred_1 obj_04 obj_09)
(pred_1 obj_06 obj_05)
)
(:goal
(and
(pred_1 obj_13 obj_09)
(pred_1 obj_11 obj_09)
(pred_1 obj_04 obj_09)
(pred_1 obj_06 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_10 obj_09) (pred_2 obj_14 obj_09))))
  )
)
)