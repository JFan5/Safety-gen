(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_01 obj_12 - type_1
obj_11 obj_07 obj_10 obj_06 - type_3
obj_08 obj_05 obj_04 - type_2
obj_02 obj_09 obj_03 - object)
(:init
(pred_3 obj_01 obj_08)
(pred_4 obj_01 obj_11)
(pred_4 obj_01 obj_07)
(pred_3 obj_12 obj_08)
(pred_4 obj_12 obj_10)
(pred_4 obj_12 obj_06)
(pred_2 obj_02 obj_05)
(pred_2 obj_09 obj_04)
(pred_2 obj_03 obj_05)
)
(:goal
(and
(pred_2 obj_02 obj_04)
(pred_2 obj_09 obj_05)
(pred_2 obj_03 obj_04)
)
)

(:constraints
  (always (not (pred_3 obj_01 obj_04)))
)
)