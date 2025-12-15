(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_04 - type_1
obj_13 obj_07 obj_12 obj_05 - type_2
obj_08 obj_02 obj_11 obj_06 - type_3
obj_10 obj_03 obj_01 - object)
(:init
(pred_3 obj_09 obj_02)
(pred_4 obj_09 obj_13)
(pred_4 obj_09 obj_07)
(pred_3 obj_04 obj_02)
(pred_4 obj_04 obj_12)
(pred_4 obj_04 obj_05)
(pred_1 obj_10 obj_08)
(pred_1 obj_03 obj_06)
(pred_1 obj_01 obj_11)
)
(:goal
(and
(pred_1 obj_10 obj_02)
(pred_1 obj_03 obj_11)
(pred_1 obj_01 obj_02)
)
)

(:constraints
  (always (not (pred_3 obj_09 obj_11)))
)
)