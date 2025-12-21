(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_03 - type_1
obj_05 obj_06 obj_07 obj_04 - type_2
obj_12 obj_01 obj_14 obj_09 - type_3
obj_10 obj_08 obj_02 obj_11 - object)
(:init
(pred_1 obj_13 obj_01)
(pred_3 obj_13 obj_05)
(pred_3 obj_13 obj_06)
(pred_1 obj_03 obj_09)
(pred_3 obj_03 obj_07)
(pred_3 obj_03 obj_04)
(pred_2 obj_10 obj_09)
(pred_2 obj_08 obj_09)
(pred_2 obj_02 obj_12)
(pred_2 obj_11 obj_14)
)
(:goal
(and
(pred_2 obj_10 obj_09)
(pred_2 obj_08 obj_14)
(pred_2 obj_02 obj_12)
(pred_2 obj_11 obj_12)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_13 obj_14) (pred_1 obj_03 obj_14))))
  )
)
)