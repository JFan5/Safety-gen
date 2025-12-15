(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_05 - type_3
obj_02 obj_03 obj_06 obj_10 - type_2
obj_04 obj_11 obj_13 obj_07 - type_1
obj_12 obj_09 obj_08 - object)
(:init
(pred_2 obj_01 obj_13)
(pred_1 obj_01 obj_02)
(pred_1 obj_01 obj_03)
(pred_2 obj_05 obj_04)
(pred_1 obj_05 obj_06)
(pred_1 obj_05 obj_10)
(pred_3 obj_12 obj_13)
(pred_3 obj_09 obj_07)
(pred_3 obj_08 obj_11)
)
(:goal
(and
(pred_3 obj_12 obj_07)
(pred_3 obj_09 obj_04)
(pred_3 obj_08 obj_07)
)
)

(:constraints
  (always (not (pred_2 obj_01 obj_07)))
)
)