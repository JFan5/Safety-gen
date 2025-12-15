(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_03 - type_1
obj_05 obj_11 obj_13 obj_12 - type_3
obj_09 obj_06 obj_14 obj_02 - type_2
obj_01 obj_04 obj_08 obj_07 - object)
(:init
(pred_3 obj_10 obj_02)
(pred_4 obj_10 obj_05)
(pred_4 obj_10 obj_11)
(pred_3 obj_03 obj_06)
(pred_4 obj_03 obj_13)
(pred_4 obj_03 obj_12)
(pred_2 obj_01 obj_02)
(pred_2 obj_04 obj_02)
(pred_2 obj_08 obj_02)
(pred_2 obj_07 obj_06)
)
(:goal
(and
(pred_2 obj_01 obj_09)
(pred_2 obj_04 obj_14)
(pred_2 obj_08 obj_14)
(pred_2 obj_07 obj_14)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_10 obj_09) (pred_3 obj_03 obj_09))))
    (always (not (and (pred_3 obj_10 obj_14) (pred_3 obj_03 obj_14))))
  )
)
)