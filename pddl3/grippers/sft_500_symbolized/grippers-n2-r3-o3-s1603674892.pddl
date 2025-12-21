(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_11 obj_05 - type_1
obj_12 obj_03 obj_10 obj_08 - type_2
obj_02 obj_07 obj_04 - type_3
obj_01 obj_06 obj_09 - object)
(:init
(pred_1 obj_11 obj_04)
(pred_3 obj_11 obj_12)
(pred_3 obj_11 obj_03)
(pred_1 obj_05 obj_04)
(pred_3 obj_05 obj_10)
(pred_3 obj_05 obj_08)
(pred_2 obj_01 obj_02)
(pred_2 obj_06 obj_04)
(pred_2 obj_09 obj_07)
)
(:goal
(and
(pred_2 obj_01 obj_02)
(pred_2 obj_06 obj_07)
(pred_2 obj_09 obj_04)
)
)

(:constraints
  (always (not (pred_1 obj_11 obj_07)))
)
)