(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_02 - type_1
obj_13 obj_08 obj_05 obj_07 - type_2
obj_03 obj_11 obj_04 obj_10 - type_3
obj_12 obj_01 obj_06 - object)
(:init
(pred_1 obj_09 obj_04)
(pred_3 obj_09 obj_13)
(pred_3 obj_09 obj_08)
(pred_1 obj_02 obj_04)
(pred_3 obj_02 obj_05)
(pred_3 obj_02 obj_07)
(pred_2 obj_12 obj_03)
(pred_2 obj_01 obj_10)
(pred_2 obj_06 obj_10)
)
(:goal
(and
(pred_2 obj_12 obj_03)
(pred_2 obj_01 obj_04)
(pred_2 obj_06 obj_04)
)
)

(:constraints
  (always (not (pred_1 obj_09 obj_10)))
)
)