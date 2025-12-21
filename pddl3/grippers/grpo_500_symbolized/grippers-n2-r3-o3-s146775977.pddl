(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_06 obj_12 - type_1
obj_10 obj_08 obj_11 obj_02 - type_3
obj_07 obj_03 obj_04 - type_2
obj_05 obj_09 obj_01 - object)
(:init
(pred_4 obj_06 obj_07)
(pred_2 obj_06 obj_10)
(pred_2 obj_06 obj_08)
(pred_4 obj_12 obj_07)
(pred_2 obj_12 obj_11)
(pred_2 obj_12 obj_02)
(pred_3 obj_05 obj_07)
(pred_3 obj_09 obj_04)
(pred_3 obj_01 obj_03)
)
(:goal
(and
(pred_3 obj_05 obj_04)
(pred_3 obj_09 obj_07)
(pred_3 obj_01 obj_03)
)
)

(:constraints
  (always (not (pred_4 obj_06 obj_04)))
)
)