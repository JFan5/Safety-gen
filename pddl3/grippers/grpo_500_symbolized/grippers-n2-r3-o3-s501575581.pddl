(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_01 obj_09 - type_1
obj_12 obj_08 obj_04 obj_06 - type_3
obj_03 obj_05 obj_07 - type_2
obj_10 obj_02 obj_11 - object)
(:init
(pred_4 obj_01 obj_05)
(pred_2 obj_01 obj_12)
(pred_2 obj_01 obj_08)
(pred_4 obj_09 obj_05)
(pred_2 obj_09 obj_04)
(pred_2 obj_09 obj_06)
(pred_3 obj_10 obj_03)
(pred_3 obj_02 obj_05)
(pred_3 obj_11 obj_03)
)
(:goal
(and
(pred_3 obj_10 obj_05)
(pred_3 obj_02 obj_05)
(pred_3 obj_11 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_01 obj_07)))
)
)