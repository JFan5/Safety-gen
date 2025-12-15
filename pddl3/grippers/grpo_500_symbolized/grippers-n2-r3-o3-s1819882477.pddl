(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_03 obj_05 - type_1
obj_01 obj_08 obj_09 obj_02 - type_3
obj_07 obj_10 obj_04 - type_2
obj_11 obj_06 obj_12 - object)
(:init
(pred_3 obj_03 obj_07)
(pred_4 obj_03 obj_01)
(pred_4 obj_03 obj_08)
(pred_3 obj_05 obj_10)
(pred_4 obj_05 obj_09)
(pred_4 obj_05 obj_02)
(pred_2 obj_11 obj_04)
(pred_2 obj_06 obj_04)
(pred_2 obj_12 obj_04)
)
(:goal
(and
(pred_2 obj_11 obj_04)
(pred_2 obj_06 obj_10)
(pred_2 obj_12 obj_07)
)
)

(:constraints
  (always (not (pred_3 obj_03 obj_04)))
)
)