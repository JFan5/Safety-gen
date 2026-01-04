(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_14 obj_07 - type_3
obj_13 obj_02 obj_12 obj_06 - type_1
obj_03 obj_10 obj_05 obj_08 - type_2
obj_04 obj_09 obj_01 obj_11 - object)
(:init
(pred_1 obj_14 obj_10)
(pred_2 obj_14 obj_13)
(pred_2 obj_14 obj_02)
(pred_1 obj_07 obj_03)
(pred_2 obj_07 obj_12)
(pred_2 obj_07 obj_06)
(pred_4 obj_04 obj_10)
(pred_4 obj_09 obj_08)
(pred_4 obj_01 obj_08)
(pred_4 obj_11 obj_10)
)
(:goal
(and
(pred_4 obj_04 obj_05)
(pred_4 obj_09 obj_03)
(pred_4 obj_01 obj_10)
(pred_4 obj_11 obj_08)
)
)

(:constraints
  (always (not (pred_1 obj_14 obj_05)))
)
)