(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_05 - type_1
obj_06 obj_01 obj_04 obj_02 - type_3
obj_08 obj_09 obj_14 obj_13 - type_2
obj_07 obj_03 obj_11 obj_10 - object)
(:init
(pred_3 obj_12 obj_13)
(pred_4 obj_12 obj_06)
(pred_4 obj_12 obj_01)
(pred_3 obj_05 obj_08)
(pred_4 obj_05 obj_04)
(pred_4 obj_05 obj_02)
(pred_2 obj_07 obj_14)
(pred_2 obj_03 obj_09)
(pred_2 obj_11 obj_14)
(pred_2 obj_10 obj_14)
)
(:goal
(and
(pred_2 obj_07 obj_08)
(pred_2 obj_03 obj_08)
(pred_2 obj_11 obj_13)
(pred_2 obj_10 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_12 obj_08) (pred_3 obj_05 obj_08))))
    (always (not (and (pred_3 obj_12 obj_14) (pred_3 obj_05 obj_14))))
  )
)
)