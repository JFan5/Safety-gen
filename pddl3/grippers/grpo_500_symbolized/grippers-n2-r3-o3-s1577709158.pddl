(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_01 obj_10 - type_1
obj_11 obj_12 obj_07 obj_04 - type_3
obj_06 obj_03 obj_08 - type_2
obj_05 obj_09 obj_02 - object)
(:init
(pred_3 obj_01 obj_08)
(pred_4 obj_01 obj_11)
(pred_4 obj_01 obj_12)
(pred_3 obj_10 obj_08)
(pred_4 obj_10 obj_07)
(pred_4 obj_10 obj_04)
(pred_2 obj_05 obj_06)
(pred_2 obj_09 obj_06)
(pred_2 obj_02 obj_08)
)
(:goal
(and
(pred_2 obj_05 obj_06)
(pred_2 obj_09 obj_06)
(pred_2 obj_02 obj_06)
)
)

(:constraints
  (always (not (pred_3 obj_01 obj_06)))
)
)