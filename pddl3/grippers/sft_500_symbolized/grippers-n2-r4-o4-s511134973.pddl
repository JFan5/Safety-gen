(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_10 - type_1
obj_09 obj_08 obj_13 obj_11 - type_3
obj_04 obj_05 obj_02 obj_14 - type_2
obj_06 obj_12 obj_01 obj_07 - object)
(:init
(pred_3 obj_03 obj_02)
(pred_4 obj_03 obj_09)
(pred_4 obj_03 obj_08)
(pred_3 obj_10 obj_04)
(pred_4 obj_10 obj_13)
(pred_4 obj_10 obj_11)
(pred_1 obj_06 obj_14)
(pred_1 obj_12 obj_14)
(pred_1 obj_01 obj_04)
(pred_1 obj_07 obj_04)
)
(:goal
(and
(pred_1 obj_06 obj_04)
(pred_1 obj_12 obj_14)
(pred_1 obj_01 obj_14)
(pred_1 obj_07 obj_14)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_03 obj_14) (pred_3 obj_10 obj_14))))
  )
)
)