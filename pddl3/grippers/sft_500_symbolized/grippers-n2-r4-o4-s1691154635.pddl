(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_14 obj_07 - type_1
obj_11 obj_04 obj_02 obj_13 - type_2
obj_03 obj_12 obj_10 obj_08 - type_3
obj_09 obj_05 obj_01 obj_06 - object)
(:init
(pred_4 obj_14 obj_08)
(pred_2 obj_14 obj_11)
(pred_2 obj_14 obj_04)
(pred_4 obj_07 obj_12)
(pred_2 obj_07 obj_02)
(pred_2 obj_07 obj_13)
(pred_1 obj_09 obj_03)
(pred_1 obj_05 obj_10)
(pred_1 obj_01 obj_12)
(pred_1 obj_06 obj_10)
)
(:goal
(and
(pred_1 obj_09 obj_08)
(pred_1 obj_05 obj_12)
(pred_1 obj_01 obj_03)
(pred_1 obj_06 obj_12)
)
)

(:constraints
  (always (not (pred_4 obj_14 obj_10)))
)
)