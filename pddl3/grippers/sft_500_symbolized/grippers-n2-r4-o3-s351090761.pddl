(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_03 obj_09 - type_3
obj_13 obj_02 obj_11 obj_12 - type_2
obj_06 obj_01 obj_08 obj_07 - type_1
obj_05 obj_04 obj_10 - object)
(:init
(pred_2 obj_03 obj_08)
(pred_1 obj_03 obj_13)
(pred_1 obj_03 obj_02)
(pred_2 obj_09 obj_08)
(pred_1 obj_09 obj_11)
(pred_1 obj_09 obj_12)
(pred_3 obj_05 obj_06)
(pred_3 obj_04 obj_07)
(pred_3 obj_10 obj_07)
)
(:goal
(and
(pred_3 obj_05 obj_06)
(pred_3 obj_04 obj_08)
(pred_3 obj_10 obj_08)
)
)

(:constraints
  (always (not (pred_2 obj_03 obj_07)))
)
)