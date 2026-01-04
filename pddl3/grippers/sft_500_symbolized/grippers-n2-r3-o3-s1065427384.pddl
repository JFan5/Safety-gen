(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_09 obj_05 - type_3
obj_10 obj_08 obj_11 obj_02 - type_2
obj_06 obj_12 obj_04 - type_1
obj_01 obj_07 obj_03 - object)
(:init
(pred_4 obj_09 obj_06)
(pred_2 obj_09 obj_10)
(pred_2 obj_09 obj_08)
(pred_4 obj_05 obj_06)
(pred_2 obj_05 obj_11)
(pred_2 obj_05 obj_02)
(pred_3 obj_01 obj_04)
(pred_3 obj_07 obj_12)
(pred_3 obj_03 obj_06)
)
(:goal
(and
(pred_3 obj_01 obj_06)
(pred_3 obj_07 obj_04)
(pred_3 obj_03 obj_12)
)
)

(:constraints
  (always (not (pred_4 obj_09 obj_04)))
)
)