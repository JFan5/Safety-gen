(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_01 - type_1
obj_05 obj_02 obj_07 obj_06 - type_2
obj_09 obj_14 obj_13 obj_03 - type_3
obj_08 obj_04 obj_11 obj_12 - object)
(:init
(pred_1 obj_10 obj_03)
(pred_3 obj_10 obj_05)
(pred_3 obj_10 obj_02)
(pred_1 obj_01 obj_13)
(pred_3 obj_01 obj_07)
(pred_3 obj_01 obj_06)
(pred_2 obj_08 obj_14)
(pred_2 obj_04 obj_09)
(pred_2 obj_11 obj_03)
(pred_2 obj_12 obj_14)
)
(:goal
(and
(pred_2 obj_08 obj_13)
(pred_2 obj_04 obj_13)
(pred_2 obj_11 obj_09)
(pred_2 obj_12 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_10 obj_09) (pred_1 obj_01 obj_09))))
    (always (not (and (pred_1 obj_10 obj_14) (pred_1 obj_01 obj_14))))
  )
)
)