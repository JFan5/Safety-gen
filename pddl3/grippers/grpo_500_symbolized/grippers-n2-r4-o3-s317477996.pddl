(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_02 - type_1
obj_12 obj_13 obj_08 obj_10 - type_3
obj_07 obj_04 obj_05 obj_11 - type_2
obj_09 obj_03 obj_01 - object)
(:init
(pred_3 obj_06 obj_05)
(pred_4 obj_06 obj_12)
(pred_4 obj_06 obj_13)
(pred_3 obj_02 obj_11)
(pred_4 obj_02 obj_08)
(pred_4 obj_02 obj_10)
(pred_2 obj_09 obj_07)
(pred_2 obj_03 obj_07)
(pred_2 obj_01 obj_04)
)
(:goal
(and
(pred_2 obj_09 obj_11)
(pred_2 obj_03 obj_11)
(pred_2 obj_01 obj_04)
)
)

(:constraints
  (always (not (pred_3 obj_06 obj_11)))
)
)