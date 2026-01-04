(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_02 - type_3
obj_09 obj_14 obj_08 obj_11 - type_2
obj_03 obj_04 obj_01 obj_05 - type_1
obj_10 obj_13 obj_06 obj_07 - object)
(:init
(pred_4 obj_12 obj_01)
(pred_3 obj_12 obj_09)
(pred_3 obj_12 obj_14)
(pred_4 obj_02 obj_03)
(pred_3 obj_02 obj_08)
(pred_3 obj_02 obj_11)
(pred_2 obj_10 obj_04)
(pred_2 obj_13 obj_04)
(pred_2 obj_06 obj_05)
(pred_2 obj_07 obj_05)
)
(:goal
(and
(pred_2 obj_10 obj_03)
(pred_2 obj_13 obj_03)
(pred_2 obj_06 obj_01)
(pred_2 obj_07 obj_03)
)
)

(:constraints
  (always (not (pred_4 obj_12 obj_05)))
)
)