(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_12 - type_1
obj_10 obj_05 obj_03 obj_14 - type_3
obj_13 obj_04 obj_08 obj_11 - type_2
obj_09 obj_06 obj_07 obj_01 - object)
(:init
(pred_3 obj_02 obj_08)
(pred_4 obj_02 obj_10)
(pred_4 obj_02 obj_05)
(pred_3 obj_12 obj_11)
(pred_4 obj_12 obj_03)
(pred_4 obj_12 obj_14)
(pred_2 obj_09 obj_13)
(pred_2 obj_06 obj_04)
(pred_2 obj_07 obj_04)
(pred_2 obj_01 obj_04)
)
(:goal
(and
(pred_2 obj_09 obj_11)
(pred_2 obj_06 obj_13)
(pred_2 obj_07 obj_04)
(pred_2 obj_01 obj_11)
)
)

(:constraints
  (always (not (pred_3 obj_02 obj_11)))
)
)