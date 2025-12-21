(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_10 - type_1
obj_01 obj_09 obj_13 obj_02 - type_3
obj_05 obj_14 obj_11 obj_03 - type_2
obj_04 obj_06 obj_08 obj_12 - object)
(:init
(pred_4 obj_07 obj_03)
(pred_2 obj_07 obj_01)
(pred_2 obj_07 obj_09)
(pred_4 obj_10 obj_11)
(pred_2 obj_10 obj_13)
(pred_2 obj_10 obj_02)
(pred_3 obj_04 obj_14)
(pred_3 obj_06 obj_11)
(pred_3 obj_08 obj_03)
(pred_3 obj_12 obj_14)
)
(:goal
(and
(pred_3 obj_04 obj_03)
(pred_3 obj_06 obj_03)
(pred_3 obj_08 obj_05)
(pred_3 obj_12 obj_05)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_07 obj_14) (pred_4 obj_10 obj_14))))
    (always (not (and (pred_4 obj_07 obj_03) (pred_4 obj_10 obj_03))))
  )
)
)