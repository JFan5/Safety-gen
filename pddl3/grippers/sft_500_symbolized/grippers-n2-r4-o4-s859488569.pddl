(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_05 - type_2
obj_04 obj_11 obj_13 obj_02 - type_3
obj_14 obj_08 obj_10 obj_03 - type_1
obj_01 obj_12 obj_06 obj_07 - object)
(:init
(pred_1 obj_09 obj_03)
(pred_2 obj_09 obj_04)
(pred_2 obj_09 obj_11)
(pred_1 obj_05 obj_03)
(pred_2 obj_05 obj_13)
(pred_2 obj_05 obj_02)
(pred_4 obj_01 obj_08)
(pred_4 obj_12 obj_03)
(pred_4 obj_06 obj_14)
(pred_4 obj_07 obj_10)
)
(:goal
(and
(pred_4 obj_01 obj_10)
(pred_4 obj_12 obj_08)
(pred_4 obj_06 obj_14)
(pred_4 obj_07 obj_03)
)
)

(:constraints
  (always (not (pred_1 obj_09 obj_10)))
)
)